import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedGradientBackground extends StatefulWidget {
  const AnimatedGradientBackground({super.key});

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF0A0E27),
                Color.lerp(
                  const Color(0xFF1A1F3A),
                  const Color(0xFF2D1B3D),
                  (_controller.value * 2) % 1,
                )!,
                const Color(0xFF0A0E27),
              ],
              stops: [
                0.0,
                0.5 + math.sin(_controller.value * 2 * math.pi) * 0.2,
                1.0,
              ],
            ),
          ),
          child: CustomPaint(
            painter: GridPainter(animation: _controller),
            child: Container(),
          ),
        );
      },
    );
  }
}

class GridPainter extends CustomPainter {
  final Animation<double> animation;

  GridPainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00D9FF).withValues(alpha: 0.03)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const spacing = 50.0;
    final offset = (animation.value * spacing) % spacing;

    // Draw vertical lines
    for (double x = -spacing + offset; x < size.width; x += spacing) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    // Draw horizontal lines
    for (double y = -spacing + offset; y < size.height; y += spacing) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }

    // Draw glowing dots at intersections
    final dotPaint = Paint()
      ..color = const Color(0xFF00D9FF).withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    for (double x = -spacing + offset; x < size.width; x += spacing * 3) {
      for (double y = -spacing + offset; y < size.height; y += spacing * 3) {
        canvas.drawCircle(Offset(x, y), 2, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant GridPainter oldDelegate) => true;
}