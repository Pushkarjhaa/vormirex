import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vormirex/view/utils/url.dart';


class CoursesController extends GetxController {
  // ── State ──────────────────────────────────────────────────────────────────
  final RxList<Map<String, dynamic>> allCourses = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredCourses =
      <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxInt selectedCategoryIndex = 0.obs;
  final RxString searchQuery = ''.obs;

  // ── Categories ─────────────────────────────────────────────────────────────
  final List<Map<String, dynamic>> categories = [
    {'label': 'All', 'tag': null},
    {'label': 'Data Science', 'tag': 'data-science'},
    {'label': 'AI/ML', 'tag': 'ai'},
    {'label': 'Cyber', 'tag': 'cyber-security'},
    {'label': 'Analytics', 'tag': 'data-analytics'},
  ];

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  // ── API ────────────────────────────────────────────────────────────────────
  Future<void> fetchCourses() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http
          .get(
            Uri.parse(coursesUrl),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        final List<dynamic> raw = body['courses'] ?? [];
        allCourses.value =
            raw.map((e) => Map<String, dynamic>.from(e as Map)).toList();
        _applyFilter();
      } else {
        errorMessage.value = 'Failed to load courses (${response.statusCode})';
      }
    } catch (e) {
      errorMessage.value = 'Network error. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  // ── Filtering ──────────────────────────────────────────────────────────────
  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
    _applyFilter();
  }

  void onSearchChanged(String query) {
    searchQuery.value = query;
    _applyFilter();
  }

  void _applyFilter() {
    List<Map<String, dynamic>> result = List.from(allCourses);

    // Category filter
    final tag = categories[selectedCategoryIndex.value]['tag'];
    if (tag != null) {
      result = result.where((course) {
        final tags = List<String>.from(course['tags'] ?? []);
        return tags.any((t) => t.contains(tag as String));
      }).toList();
    }

    // Search filter
    final q = searchQuery.value.trim().toLowerCase();
    if (q.isNotEmpty) {
      result = result.where((course) {
        final title = (course['title'] ?? '').toString().toLowerCase();
        final subtitle = (course['subtitle'] ?? '').toString().toLowerCase();
        final description =
            (course['description'] ?? '').toString().toLowerCase();
        final tags = List<String>.from(course['tags'] ?? []);
        return title.contains(q) ||
            subtitle.contains(q) ||
            description.contains(q) ||
            tags.any((t) => t.contains(q));
      }).toList();
    }

    filteredCourses.value = result;
  }

  // ── Helpers ────────────────────────────────────────────────────────────────
  int courseCountForCategory(int index) {
    final tag = categories[index]['tag'];
    if (tag == null) return allCourses.length;
    return allCourses.where((course) {
      final tags = List<String>.from(course['tags'] ?? []);
      return tags.any((t) => t.contains(tag as String));
    }).length;
  }

  /// Sum durations across all levels → "7 months"
  String getTotalDuration(Map<String, dynamic> course) {
    final levels = List<Map<String, dynamic>>.from(
      (course['levels'] ?? []).map((e) => Map<String, dynamic>.from(e as Map)),
    );
    int total = 0;
    for (final level in levels) {
      final duration = (level['duration'] ?? '').toString();
      final match = RegExp(r'(\d+)').firstMatch(duration);
      if (match != null) total += int.parse(match.group(1)!);
    }
    return total > 0 ? '$total months' : '';
  }

  /// Count total modules across all levels
  int getTotalModules(Map<String, dynamic> course) {
    final levels = List<Map<String, dynamic>>.from(
      (course['levels'] ?? []).map((e) => Map<String, dynamic>.from(e as Map)),
    );
    return levels.fold(0, (sum, level) {
      final modules = List.from(level['modules'] ?? []);
      return sum + modules.length;
    });
  }

  /// Format price from paise → ₹X.Xk
  String getFormattedPrice(Map<String, dynamic> course) {
    final price = (course['price'] ?? 0) as int;
    final inr = price / 100;
    if (inr >= 1000) {
      return '₹${(inr / 1000).toStringAsFixed(1)}k';
    }
    return '₹${inr.toStringAsFixed(0)}';
  }
}