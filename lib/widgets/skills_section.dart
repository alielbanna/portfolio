import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _horizontalPaddingDesktop = 80.0;
  static const _horizontalPaddingMobile = 24.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final isTablet = size.width >= 600 && size.width < 1024;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? _horizontalPaddingMobile
            : _horizontalPaddingDesktop,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(isMobile, isTablet),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = isMobile ? 1 : 2;
              final itemWidth =
                  (constraints.maxWidth - (24 * (columns - 1))) / columns;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: _skills
                    .map(
                      (skill) => SizedBox(
                    width: itemWidth,
                    child: _SkillCategoryCard(data: skill),
                  ),
                )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(bool isMobile, bool isTablet) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFF00D9FF), Color(0xFFFF006E)],
      ).createShader(bounds),
      child: Text(
        'Technical Skills',
        style: TextStyle(
          fontSize: isMobile ? 32 : (isTablet ? 40 : 48),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// -----------------------------
/// Data
/// -----------------------------
final _skills = <_SkillCategoryData>[
  _SkillCategoryData(
    title: 'Mobile Development',
    icon: Icons.phone_android,
    color: Color(0xFF00D9FF),
    skills: ['Flutter', 'Dart', 'Android SDK', 'iOS SDK', 'Cross-platform'],
  ),
  _SkillCategoryData(
    title: 'State Management',
    icon: Icons.settings_suggest,
    color: Color(0xFF00FFA3),
    skills: ['BLoC', 'Provider', 'Riverpod', 'GetX'],
  ),
  _SkillCategoryData(
    title: 'Backend & Services',
    icon: Icons.cloud,
    color: Color(0xFFFF006E),
    skills: ['Firebase', 'REST APIs', 'WebSocket', 'SQLite'],
  ),
  _SkillCategoryData(
    title: 'Architecture',
    icon: Icons.architecture,
    color: Color(0xFFFF8A00),
    skills: [
      'Clean Architecture',
      'SOLID',
      'MVVM',
      'Repository Pattern',
      'Dependency Injection',
    ],
  ),
];

/// -----------------------------
/// Card
/// -----------------------------
class _SkillCategoryCard extends StatefulWidget {
  const _SkillCategoryCard({required this.data});

  final _SkillCategoryData data;

  @override
  State<_SkillCategoryCard> createState() => _SkillCategoryCardState();
}

class _SkillCategoryCardState extends State<_SkillCategoryCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final d = widget.data;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1F3A)
              .withValues(alpha: _hovered ? 0.8 : 0.55),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: d.color.withValues(alpha: _hovered ? 0.6 : 0.3),
          ),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: d.color.withValues(alpha: 0.25),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(d),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: d.skills.map(_skillChip).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(_SkillCategoryData d) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: d.color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(d.icon, color: d.color, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            d.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,

            ),
            overflow: TextOverflow.fade,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget _skillChip(String skill) {
    final color = widget.data.color;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// -----------------------------
/// Model
/// -----------------------------
class _SkillCategoryData {
  final String title;
  final List<String> skills;
  final IconData icon;
  final Color color;

  const _SkillCategoryData({
    required this.title,
    required this.skills,
    required this.icon,
    required this.color,
  });
}
