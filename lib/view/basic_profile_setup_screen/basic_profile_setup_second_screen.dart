import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:vormirex/view/basic_profile_setup_screen/basic_profile_setup_third_screen.dart';

class ProfileSetupSecondScreen extends StatefulWidget {
  const ProfileSetupSecondScreen({super.key});

  @override
  State<ProfileSetupSecondScreen> createState() =>
      _ProfileSetupSecondScreenState();
}

class _ProfileSetupSecondScreenState extends State<ProfileSetupSecondScreen> {
  String selectedPace = 'Fast Track';
  Set<String> selectedFormats = {'Reading'};
  double dailyGoalMinutes = 20.0;
  String selectedChallenge = 'Beginner - friendly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      appBar: AppBar(
        backgroundColor: const Color(0xFF252525),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Setup Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Progress indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFF6aece1),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: 8,
                height: 5,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'STEP 2 OF 3',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 24),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    'Optimize Your Learning\nStyle',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Tell us how you learn best so Vormirex can adapt.',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  const SizedBox(height: 32),

                  // Daily Goals Widget
                  DailyGoalsWidget(
                    initialMinutes: dailyGoalMinutes,
                    initialChallenge: selectedChallenge,
                    onMinutesChanged: (value) {
                      setState(() {
                        dailyGoalMinutes = value;
                      });
                    },
                    onChallengeChanged: (value) {
                      setState(() {
                        selectedChallenge = value;
                      });
                    },
                  ),
                  const SizedBox(height: 32),

                  // Learning Pace Section
                  Row(
                    children: [
                      Icon(
                        Icons.speed,
                        color: const Color(0xFF6aece1),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Learning Pace',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Fast Track Option
                  _buildPaceOption(
                    'Fast Track',
                    'Quick lessons, minimal theory',
                    Icons.school,
                    isSelected: selectedPace == 'Fast Track',
                    onTap: () => setState(() => selectedPace = 'Fast Track'),
                  ),
                  const SizedBox(height: 12),

                  // Balanced Option
                  _buildPaceOption(
                    'Balanced',
                    'concept + practice',
                    Icons.emoji_events,
                    isSelected: selectedPace == 'Balanced',
                    isDefault: true,
                    onTap: () => setState(() => selectedPace = 'Balanced'),
                  ),
                  const SizedBox(height: 12),

                  // Deep Focus Option
                  _buildPaceOption(
                    'Deep Focus',
                    'Detailed explanations & example',
                    Icons.psychology,
                    isSelected: selectedPace == 'Deep Focus',
                    onTap: () => setState(() => selectedPace = 'Deep Focus'),
                  ),
                  const SizedBox(height: 32),

                  // Format Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: const Color(0xFF6aece1),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Format',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Multi-select',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Format chips
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildFormatChip(
                        'Reading',
                        Icons.menu_book,
                        isSelected: selectedFormats.contains('Reading'),
                        onTap: () => _toggleFormat('Reading'),
                      ),
                      _buildFormatChip(
                        'Short Videos',
                        Icons.play_circle_outline,
                        isSelected: selectedFormats.contains('Short Videos'),
                        onTap: () => _toggleFormat('Short Videos'),
                      ),
                      _buildFormatChip(
                        'Practice & Exercises',
                        Icons.edit_note,
                        isSelected: selectedFormats.contains(
                          'Practice & Exercises',
                        ),
                        onTap: () => _toggleFormat('Practice & Exercises'),
                      ),
                      _buildFormatChip(
                        'AI Explanations',
                        Icons.refresh,
                        isSelected: selectedFormats.contains('AI Explanations'),
                        onTap: () => _toggleFormat('AI Explanations'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // AI Insight Box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2a2a2a),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.smart_toy,
                          color: const Color(0xFF6aece1),
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'AI INSIGHT',
                                style: TextStyle(
                                  color: const Color(0xFF6aece1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Great choice. Based on "Master a Skill" in Coding & Physics, I\'ll prioritize practical exercises and problem-solving modules.',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => LearningGoalsScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6aece1),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Generate Learning Path',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressDot(bool isActive) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color(0xFF6aece1) : Colors.grey,
      ),
    );
  }

  Widget _buildPaceOption(
    String title,
    String subtitle,
    IconData icon, {
    required bool isSelected,
    bool isDefault = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2a2a2a),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF6aece1) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF3a3a3a),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: isSelected ? const Color(0xFF6aece1) : Colors.grey,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (isDefault) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3a5a5a),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'DEFAULT',
                            style: TextStyle(
                              color: Color(0xFF6aece1),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: const Color(0xFF6aece1),
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormatChip(
    String label,
    IconData icon, {
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF6aece1) : const Color(0xFF2a2a2a),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.black : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFormat(String format) {
    setState(() {
      if (selectedFormats.contains(format)) {
        selectedFormats.remove(format);
      } else {
        selectedFormats.add(format);
      }
    });
  }
}

// Daily Goals Widget Component
class DailyGoalsWidget extends StatefulWidget {
  final double initialMinutes;
  final String initialChallenge;
  final ValueChanged<double>? onMinutesChanged;
  final ValueChanged<String>? onChallengeChanged;

  const DailyGoalsWidget({
    Key? key,
    this.initialMinutes = 20.0,
    this.initialChallenge = 'Beginner - friendly',
    this.onMinutesChanged,
    this.onChallengeChanged,
  }) : super(key: key);

  @override
  State<DailyGoalsWidget> createState() => _DailyGoalsWidgetState();
}

class _DailyGoalsWidgetState extends State<DailyGoalsWidget> {
  late double _sliderValue;
  late String _selectedChallenge;

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.initialMinutes;
    _selectedChallenge = widget.initialChallenge;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Daily Goals Section
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF6aece1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(Icons.check, color: Colors.black, size: 14),
              ),
              const SizedBox(width: 8),
              const Text(
                'Daily Goals',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Slider
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: const Color(0xFF6aece1),
                  inactiveTrackColor: const Color(0xFF252525),
                  thumbColor: const Color(0xFF6aece1),
                  overlayColor: const Color(0xFF6aece1).withOpacity(0.2),
                  trackHeight: 4,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 8,
                  ),
                ),
                child: Slider(
                  value: _sliderValue,
                  min: 10,
                  max: 60,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                    widget.onMinutesChanged?.call(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTimeLabel('10m'),
                    _buildTimeLabel('20m'),
                    _buildTimeLabel('30m'),
                    _buildTimeLabel('40m'),
                    _buildTimeLabel('50m'),
                    _buildTimeLabel('60m'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'We\'ll design sessions that fit your ${_sliderValue.round()} minute schedule',
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 24),

          // Challenge Level Section
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF6aece1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.show_chart,
                  color: Colors.black,
                  size: 14,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Challenge Level',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Challenge Options
          _buildChallengeOption(
            'Beginner - friendly',
            Icons.emoji_emotions_outlined,
          ),
          const SizedBox(height: 10),
          _buildChallengeOption('Progressive growth', Icons.trending_up),
          const SizedBox(height: 10),
          _buildChallengeOption(
            'Advanced & challenging',
            Icons.whatshot_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeLabel(String label) {
    return Text(
      label,
      style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
    );
  }

  Widget _buildChallengeOption(String title, IconData icon) {
    final isSelected = _selectedChallenge == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedChallenge = title;
        });
        widget.onChallengeChanged?.call(title);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF252525),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: const Color(0xFF6aece1), width: 2)
              : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white.withOpacity(0.7), size: 20),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
