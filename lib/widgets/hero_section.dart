import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onScrollToProjects;
  final AnimationController floatingAnimation;

  const HeroSection({
    super.key,
    required this.onScrollToProjects,
    required this.floatingAnimation,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(_fadeAnimation);

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  // ===============================
  // ACTIONS
  // ===============================

  Future<void> _launchEmail() async {
    if (kIsWeb) {
      await launchUrl(
        Uri.parse(
          'https://mail.google.com/mail/?view=cm&fs=1&to=alielbana6662@gmail.com',
        ),
        mode: LaunchMode.externalApplication,
      );
      return;
    }

    await launchUrl(
      Uri(scheme: 'mailto', path: 'alielbana6662@gmail.com'),
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> _launchPhone() async {
    await launchUrl(
      Uri.parse('tel:+201129937838'),
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> _launchGitHub() async {
    await launchUrl(
      Uri.parse('https://github.com/alielbanna'),
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> _launchLinkedIn() async {
    await launchUrl(
      Uri.parse('https://www.linkedin.com/in/ali-elbanna'),
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> _downloadCV() async {
    const cvUrl =
        'https://raw.githubusercontent.com/alielbanna/portfolio/main/assets/Ali_ElBanna_Flutter_Developer.pdf';

    final success = await launchUrl(
      Uri.parse(cvUrl),
      mode: LaunchMode.externalApplication,
    );

    if (!success && mounted) {
      _showError('Could not open CV. Please contact me directly.');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFFF006E),
      ),
    );
  }

  // ===============================
  // UI
  // ===============================

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final isTablet = size.width >= 600 && size.width < 1024;

    return SizedBox(
      height: size.height,
      child: Stack(
        children: [
          _floatingParticles(size, isMobile),
          _content(size, isMobile, isTablet),
          _scrollIndicator(isMobile),
        ],
      ),
    );
  }

  Widget _floatingParticles(Size size, bool isMobile) {
    return Stack(
      children: List.generate(isMobile ? 10 : 20, (index) {
        return AnimatedBuilder(
          animation: widget.floatingAnimation,
          builder: (_, __) {
            final progress =
                (widget.floatingAnimation.value + index / 20) % 1;

            final x = (index % 4) * size.width / 4 +
                math.sin(progress * 2 * math.pi + index) * 30;
            final y = progress * size.height;

            return Positioned(
              left: x,
              top: y,
              child: Container(
                width: isMobile ? 3 : 4,
                height: isMobile ? 3 : 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF00D9FF).withValues(alpha: 0.35),
                  boxShadow: [
                    BoxShadow(
                      color:
                      const Color(0xFF00D9FF).withValues(alpha: 0.5),
                      blurRadius: isMobile ? 6 : 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _content(Size size, bool isMobile, bool isTablet) {
    return Center(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _greeting(isMobile, isTablet),
                _name(size, isMobile, isTablet),
                _title(isMobile, isTablet),
                _description(size, isMobile, isTablet),
                const SizedBox(height: 40),
                _buttons(isMobile),
                const SizedBox(height: 50),
                _socialLinks(isMobile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _greeting(bool isMobile, bool isTablet) {
    return ShaderMask(
      shaderCallback: (b) => const LinearGradient(
        colors: [Color(0xFF00D9FF), Color(0xFF00FFA3)],
      ).createShader(b),
      child: Text(
        "Hi, I'm",
        style: TextStyle(
          fontSize: isMobile ? 18 : (isTablet ? 24 : 32),
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _name(Size size, bool isMobile, bool isTablet) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        'Ali Ramadan El Banna',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: isMobile ? 32 : (isTablet ? 48 : 72),
          fontWeight: FontWeight.bold,
          foreground: Paint()
            ..shader = const LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFFFF006E)],
            ).createShader(Rect.fromLTWH(0, 0, size.width, 100)),
        ),
      ),
    );
  }

  Widget _title(bool isMobile, bool isTablet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        const Icon(Icons.code, color: Color(0xFF00D9FF)),
        Text(
          'Flutter Developer',
          style: TextStyle(
            fontSize: isMobile ? 18 : (isTablet ? 24 : 36),
            color: const Color(0xFF00D9FF),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _description(Size size, bool isMobile, bool isTablet) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        width: isMobile ? size.width - 40 : 700,
        child: Text(
          '3+ years building cross-platform mobile apps • '
              '9+ production apps shipped • Clean Architecture enthusiast',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 13 : (isTablet ? 16 : 20),
            color: Colors.white.withValues(alpha: 0.7),
            height: 1.6,
          ),
        ),
      ),
    );
  }

  Widget _buttons(bool isMobile) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        _glowButton(
          'View Projects',
          Icons.rocket_launch,
          true,
          widget.onScrollToProjects,
          isMobile,
        ),
        _glowButton(
          'Download CV',
          Icons.download,
          false,
          _downloadCV,
          isMobile,
        ),
      ],
    );
  }

  Widget _socialLinks(bool isMobile) {
    return Wrap(
      spacing: isMobile ? 16 : 24,
      alignment: WrapAlignment.center,
      children: [
        _socialIcon(Icons.email, 'Email', _launchEmail, isMobile),
        _socialIcon(Icons.phone, 'Call', _launchPhone, isMobile),
        _socialIcon(Icons.code, 'GitHub', _launchGitHub, isMobile),
        _socialIcon(Icons.work, 'LinkedIn', _launchLinkedIn, isMobile),
      ],
    );
  }

  Widget _scrollIndicator(bool isMobile) {
    if (isMobile) return const SizedBox.shrink();

    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: widget.floatingAnimation,
        builder: (_, __) {
          return Transform.translate(
            offset: Offset(
              0,
              math.sin(widget.floatingAnimation.value * 2 * math.pi) * 10,
            ),
            child: Column(
              children: [
                Text(
                  'Scroll to explore',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFF00D9FF),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ===============================
  // COMPONENTS
  // ===============================

  Widget _glowButton(
      String text,
      IconData icon,
      bool primary,
      VoidCallback onTap,
      bool isMobile,
      ) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool hovered = false;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => hovered = true),
          onExit: (_) => setState(() => hovered = false),
          child: GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform:
              hovered ? (Matrix4.identity()..scale(1.05)) : null,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 32,
                vertical: isMobile ? 12 : 16,
              ),
              decoration: BoxDecoration(
                gradient: primary
                    ? const LinearGradient(
                  colors: [Color(0xFF00D9FF), Color(0xFF00FFA3)],
                )
                    : null,
                borderRadius: BorderRadius.circular(30),
                border: primary
                    ? null
                    : Border.all(color: const Color(0xFF00D9FF), width: 2),
                boxShadow: primary
                    ? [
                  BoxShadow(
                    color: const Color(0xFF00D9FF)
                        .withValues(alpha: hovered ? 0.8 : 0.5),
                    blurRadius: hovered ? 30 : 20,
                  ),
                ]
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon,
                      color: primary
                          ? const Color(0xFF0A0E27)
                          : const Color(0xFF00D9FF)),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: TextStyle(
                      color: primary
                          ? const Color(0xFF0A0E27)
                          : const Color(0xFF00D9FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _socialIcon(
      IconData icon,
      String label,
      VoidCallback onTap,
      bool isMobile,
      ) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool hovered = false;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => hovered = true),
          onExit: (_) => setState(() => hovered = false),
          child: Tooltip(
            message: label,
            textStyle: const TextStyle(color: Colors.white), // text color
            decoration: BoxDecoration(
              color: Colors.black87, // dark background
              borderRadius: BorderRadius.circular(8),
            ),
            child: GestureDetector(
              onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.all(isMobile ? 10 : 12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF00D9FF)
                        .withValues(alpha: hovered ? 0.7 : 0.3),
                  ),
                  boxShadow: hovered
                      ? [
                    BoxShadow(
                      color: const Color(0xFF00D9FF)
                          .withValues(alpha: 0.4),
                      blurRadius: 12,
                    ),
                  ]
                      : [],
                ),
                child: Icon(icon,
                    color: const Color(0xFF00D9FF),
                    size: isMobile ? 18 : 20),
              ),
            ),
          ),
        );
      },
    );
  }
}
