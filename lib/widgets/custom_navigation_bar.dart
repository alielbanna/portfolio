import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final Function(String) onNavigate;

  const CustomNavigationBar({
    super.key,
    required this.onNavigate,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(_animation),
      child: Container(
        margin: EdgeInsets.all(isMobile ? 16 : 24),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 32,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1F3A).withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: const Color(0xFF00D9FF).withValues(alpha: 0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00D9FF).withValues(alpha: 0.2),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: isMobile
            ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'home'),
            _buildNavItem(Icons.person, 'about'),
            _buildNavItem(Icons.code, 'skills'),
            _buildNavItem(Icons.work, 'projects'),
            _buildNavItem(Icons.email, 'contact'),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNavButton('Home', 'home'),
            const SizedBox(width: 8),
            _buildNavButton('About', 'about'),
            const SizedBox(width: 8),
            _buildNavButton('Skills', 'skills'),
            const SizedBox(width: 8),
            _buildNavButton('Projects', 'projects'),
            const SizedBox(width: 8),
            _buildNavButton('Experience', 'experience'),
            const SizedBox(width: 8),
            _buildNavButton('Contact', 'contact'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String label, String section) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onNavigate(section),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String section) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: section,
        textStyle: const TextStyle(color: Colors.white), // text color
        decoration: BoxDecoration(
          color: Colors.black87, // dark background
          borderRadius: BorderRadius.circular(8),
        ),
        child: GestureDetector(
          onTap: () => widget.onNavigate(section),
          child: Icon(
            icon,
            color: const Color(0xFF00D9FF),
            size: 24,
          ),
        ),
      ),
    );
  }
}