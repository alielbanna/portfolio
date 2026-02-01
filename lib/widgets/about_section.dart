import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const _desktopPadding = 80.0;
  static const _mobilePadding = 24.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final isTablet = size.width >= 600 && size.width < 1024;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? _mobilePadding : _desktopPadding,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(isMobile,isTablet),
          const SizedBox(height: 40),
          _aboutCard(isMobile),
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
        'About Me',
        style: TextStyle(
          fontSize: isMobile ? 32 : (isTablet ? 40 : 48),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _aboutCard(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F3A).withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF00D9FF).withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _aboutText(),
          const SizedBox(height: 40),
          _statsGrid(isMobile),
        ],
      ),
    );
  }

  Widget _aboutText() {
    return Text(
      'Flutter Developer with 3+ years of professional experience delivering '
          'cross-platform mobile applications for healthcare, ERP, and HRM systems. '
          'Successfully shipped 9+ production apps with a proven track record of '
          'implementing clean architecture patterns and leading development teams.',
      style: TextStyle(
        fontSize: 18,
        color: Colors.white.withValues(alpha: 0.9),
        height: 1.8,
      ),
    );
  }

  Widget _statsGrid(bool isMobile) {
    final columns = isMobile ? 2 : 4;

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth =
            (constraints.maxWidth - (16 * (columns - 1))) / columns;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: _stats
              .map(
                (stat) => SizedBox(
              width: itemWidth,
              child: _StatCard(data: stat),
            ),
          )
              .toList(),
        );
      },
    );
  }
}

/// -----------------------------
/// Data
/// -----------------------------
final _stats = <_StatData>[
  _StatData('9+', 'Apps Shipped', Icons.rocket_launch),
  _StatData('3+', 'Years Experience', Icons.calendar_today),
  _StatData('5', 'Corporate Projects', Icons.business),
  _StatData('4+', 'Freelance Projects', Icons.work),
];

/// -----------------------------
/// Stat Card (with hover)
/// -----------------------------
class _StatCard extends StatefulWidget {
  const _StatCard({required this.data});

  final _StatData data;

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final color = const Color(0xFF00D9FF);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: color.withValues(alpha: _hovered ? 0.2 : 0.12),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withValues(alpha: _hovered ? 0.6 : 0.3),
          ),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ]
              : [],
        ),
        child: Column(
          children: [
            Icon(widget.data.icon, color: color, size: 32),
            const SizedBox(height: 12),
            Text(
              widget.data.value,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00D9FF),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.data.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// -----------------------------
/// Model
/// -----------------------------
class _StatData {
  final String value;
  final String label;
  final IconData icon;

  const _StatData(this.value, this.label, this.icon);
}
