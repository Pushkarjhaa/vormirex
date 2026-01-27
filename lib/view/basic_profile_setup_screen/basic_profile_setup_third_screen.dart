import 'package:flutter/material.dart';

class LearningGoalsScreen extends StatefulWidget {
  const LearningGoalsScreen({Key? key}) : super(key: key);

  @override
  State<LearningGoalsScreen> createState() => _LearningGoalsScreenState();
}

class _LearningGoalsScreenState extends State<LearningGoalsScreen> {
  String selectedGoal = 'Real Projects';
  String selectedLevel = 'Intermediate';
  Set<String> selectedFocusAreas = {'Roadmap', 'Mini Projects'};
  double timelineMonths = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a1a),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildProgressDot(false),
                  const SizedBox(width: 8),
                  _buildProgressDot(false),
                  const SizedBox(width: 8),
                  _buildProgressDot(true),
                ],
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'STEP 3 OF 3',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Title
              const Text(
                'Define Your Learning\nGoals',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Customize Your AI path for maximum impact.',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 32),

              // Goals Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.3,
                children: [
                  _buildGoalCard(
                    'Job-ready',
                    'Get hired fast',
                    Icons.school_outlined,
                    'Job-ready',
                  ),
                  _buildGoalCard(
                    'Real Projects',
                    'Build Portfolio',
                    Icons.rocket_launch_outlined,
                    'Real Projects',
                  ),
                  _buildGoalCard(
                    'Ace Exam',
                    'Top scores',
                    Icons.work_outline,
                    'Ace Exam',
                  ),
                  _buildGoalCard(
                    'Daily Habit',
                    'Consistency',
                    Icons.calendar_today_outlined,
                    'Daily Habit',
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Current Skill Level
              Row(
                children: [
                  Icon(
                    Icons.bar_chart,
                    color: const Color(0xFF6aece1),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Current Skill Level',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildLevelChip('Beginner', 'Beginner'),
                  const SizedBox(width: 12),
                  _buildLevelChip('Intermediate', 'Intermediate'),
                  const SizedBox(width: 12),
                  _buildLevelChip('Advanced', 'Advanced'),
                ],
              ),
              const SizedBox(height: 32),

              // Focus Areas
              Row(
                children: [
                  Icon(
                    Icons.track_changes,
                    color: const Color(0xFF6aece1),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Focus Areas ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '(Select multiple)',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildFocusChip('Roadmap', 'Roadmap'),
                  _buildFocusChip('Practice Problems', 'Practice Problems'),
                  _buildFocusChip('Concept Clarity', 'Concept Clarity'),
                  _buildFocusChip('Mini Projects', 'Mini Projects'),
                  _buildFocusChip('AI Feedback', 'AI Feedback'),
                ],
              ),
              const SizedBox(height: 32),

              // Timeline
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timeline,
                        color: const Color(0xFF6aece1),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Timeline',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${timelineMonths.toInt()} months',
                    style: const TextStyle(
                      color: Color(0xFF6aece1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF252525),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: const Color(0xFF6aece1),
                        inactiveTrackColor: Colors.grey.shade800,
                        thumbColor: const Color(0xFF6aece1),
                        overlayColor: const Color(0xFF6aece1).withOpacity(0.2),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 12,
                        ),
                        trackHeight: 4,
                      ),
                      child: Slider(
                        value: timelineMonths,
                        min: 1,
                        max: 6,
                        divisions: 5,
                        onChanged: (value) {
                          setState(() {
                            timelineMonths = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTimelineLabel('1m'),
                        _buildTimelineLabel('2m'),
                        _buildTimelineLabel('3m'),
                        _buildTimelineLabel('4m'),
                        _buildTimelineLabel('5m'),
                        _buildTimelineLabel('6m'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'We\'ll design sessions that fit your ${timelineMonths.toInt()} month schedule',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // AI Insight
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF252525),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6aece1).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.psychology_outlined,
                        color: Color(0xFF6aece1),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'AI INSIGHT',
                            style: TextStyle(
                              color: Color(0xFF6aece1),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                height: 1.5,
                              ),
                              children: [
                                TextSpan(
                                  text: '"I\'m tailoring a path focusing on ',
                                ),
                                TextSpan(
                                  text: 'Real Projects',
                                  style: TextStyle(
                                    color: Color(0xFF6aece1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(text: ' for an '),
                                TextSpan(
                                  text: 'intermediate',
                                  style: TextStyle(
                                    color: Color(0xFF6aece1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' level. Expect a hands-on approach. "',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Generate Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6aece1),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Generate My Learning Path',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressDot(bool isActive) {
    return Container(
      width: 30,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF6aece1) : Colors.grey.shade800,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildGoalCard(
    String title,
    String subtitle,
    IconData icon,
    String value,
  ) {
    final isSelected = selectedGoal == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGoal = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF252525),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF6aece1) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF6aece1).withOpacity(0.1)
                    : Colors.grey.shade800.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected ? const Color(0xFF6aece1) : Colors.grey,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade300,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(height: 0),
            Text(
              subtitle,
              style: TextStyle(
                color: isSelected ? const Color(0xFF6aece1) : Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelChip(String label, String value) {
    final isSelected = selectedLevel == value;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedLevel = value;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF6aece1)
                : const Color(0xFF252525),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey.shade300,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFocusChip(String label, String value) {
    final isSelected = selectedFocusAreas.contains(value);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedFocusAreas.remove(value);
          } else {
            selectedFocusAreas.add(value);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF6aece1) : const Color(0xFF252525),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              const Icon(Icons.check, color: Colors.black, size: 18),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey.shade300,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineLabel(String label) {
    return Text(
      label,
      style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
    );
  }
}
