import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  // Helper to open URLs
  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final isTablet = size.width >= 600 && size.width < 1024;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 60 : (isTablet ? 80 : 100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          _buildSectionHeader(isMobile, isTablet),
          SizedBox(height: isMobile ? 40 : 60),

          // Featured Projects
          _buildProjectCard(
            title: 'Gdawel ERP',
            subtitle: 'Enterprise Resource Planning',
            description:
                'Complete ERP solution with mobile app and POS web interface for inventory, sales management, and business analytics across multiple locations.',
            tags: ['Flutter', 'GetX', 'REST API', 'Hive'],
            achievements: [
              'Multi-location support with real-time sync',
              'Offline-first architecture',
              'Sales analytics dashboard',
              '5+ warehouse locations',
            ],
            icon: Icons.business_center,
            gradient: const LinearGradient(
              colors: [Color(0xFFFF006E), Color(0xFFFF8A00)],
            ),
            googlePlayUrl:
                'https://play.google.com/store/apps/details?id=com.gdawel.app',
            appStoreUrl:
                'https://apps.apple.com/us/app/جداول-المحاسبي/id6741044144',
            webAppUrl: 'https://pos.gdawel.app/',
            websiteUrl: 'https://gdawel.app/',
            isMobile: isMobile,
            isTablet: isTablet,
          ),

          SizedBox(height: isMobile ? 24 : 40),

          _buildProjectCard(
            title: 'COPA - Playground Reservation',
            subtitle: 'Sports Facility Booking Platform',
            description:
                'Led a 3-person team to build a comprehensive sports booking platform with real-time availability, payment integration, and user management.',
            tags: [
              'Flutter',
              'Provider',
              'Firebase',
              'Google Maps',
              'Payment Gateway',
            ],
            achievements: [
              '30% reduction in load times',
              'Published on Google Play Store',
              'Real-time booking system',
              'Clean Architecture with MVVM',
            ],
            icon: Icons.sports_soccer,
            gradient: const LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFF00FFA3)],
            ),
            googlePlayUrl:
                'https://play.google.com/store/apps/details?id=com.banna.copa',
            isMobile: isMobile,
            isTablet: isTablet,
          ),

          SizedBox(height: isMobile ? 24 : 40),

          _buildProjectCard(
            title: 'Pasma HRM',
            subtitle: 'Human Resource Management',
            description:
                'HR management system with attendance tracking via geofencing and QR codes, leave management, and comprehensive analytics dashboard.',
            tags: ['Flutter', 'GetX', 'Firebase', 'Google Maps', 'FCM'],
            achievements: [
              '15+ hours weekly saved in manual processing',
              'Automated attendance with geofencing',
              'HR metrics analytics dashboard',
              'Document management with cloud storage',
            ],
            icon: Icons.people,
            gradient: const LinearGradient(
              colors: [Color(0xFFFF006E), Color(0xFFFF006E)],
            ),
            websiteUrl: 'https://pasma.hashstudio.dev',
            isMobile: isMobile,
            isTablet: isTablet,
          ),

          SizedBox(height: isMobile ? 24 : 40),

          _buildProjectCard(
            title: 'EyeTrack Medical System',
            subtitle: 'Healthcare Management Platform',
            description:
                'Medical appointment scheduling and patient records management system with surgery coordination and role-based access control.',
            tags: [
              'Flutter',
              'Provider',
              'Firebase',
              'SQLite',
              'PDF Generation',
            ],
            achievements: [
              '60% reduction in scheduling errors',
              'Role-based access (doctors, nurses, admin)',
              'Patient record management',
              'Appointment conflict detection',
            ],
            icon: Icons.local_hospital,
            gradient: const LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFF8B5CF6)],
            ),
            isMobile: isMobile,
            isTablet: isTablet,
          ),

          SizedBox(height: isMobile ? 40 : 60),

          // Personal Projects Section
          Text(
            'Personal Projects',
            style: TextStyle(
              fontSize: isMobile ? 24 : (isTablet ? 32 : 36),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: isMobile ? 24 : 32),

          // Grid of personal projects
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = isMobile ? 1 : (isTablet ? 2 : 2);
              final itemWidth =
                  (constraints.maxWidth - (columns - 1) * 20) / columns;

              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  SizedBox(
                    width: isMobile ? constraints.maxWidth : itemWidth,
                    child: _buildMiniProjectCard(
                      title: 'ShopEasy - E-Commerce App',
                      description:
                          'A fully-featured, modern e-commerce mobile application built with Flutter, Firebase, and Riverpod state management.',
                      tags: ['Riverpod', 'Firebase', 'Hive', 'go_router'],
                      icon: Icons.shopping_cart,
                      color: const Color(0xFF00FFA3),
                      isMobile: isMobile,
                      githubUrl: 'https://github.com/alielbanna/shopeasy.git',
                    ),
                  ),
                  SizedBox(
                    width: isMobile ? constraints.maxWidth : itemWidth,
                    child: _buildMiniProjectCard(
                      title: 'Chat App',
                      description:
                          'A real-time chat application built with Flutter and Firebase, featuring end-to-end messaging, media sharing, and push notifications.',
                      tags: ['BLoC', 'GetIt', 'FCM', 'Hive'],
                      icon: Icons.chat,
                      color: const Color(0xFF00D9FF),
                      isMobile: isMobile,
                      githubUrl: 'https://github.com/alielbanna/chat_app.git',
                    ),
                  ),
                  SizedBox(
                    width: isMobile ? constraints.maxWidth : itemWidth,
                    child: _buildMiniProjectCard(
                      title: 'Health & Fitness Tracker',
                      description:
                          'A comprehensive Flutter application for tracking fitness activities, workouts, health metrics, and personal goals with offline-first architecture and real-time synchronization.',
                      tags: [
                        'Riverpod',
                        'Sensors',
                        'Hive',
                        'fl_chart',
                        'geolocator',
                      ],
                      icon: Icons.favorite,
                      color: const Color(0xFFFF006E),
                      isMobile: isMobile,
                      githubUrl:
                          'https://github.com/alielbanna/health_fitness_tracker.git',
                    ),
                  ),
                  SizedBox(
                    width: isMobile ? constraints.maxWidth : itemWidth,
                    child: _buildMiniProjectCard(
                      title: 'SecureVault - Enterprise Password Manager',
                      description:
                          'A production-ready, enterprise-grade password manager built with Flutter, featuring bank-level encryption, biometric authentication, and multi-environment support.',
                      tags: [
                        'Riverpod',
                        'Hive',
                        'PointyCastle',
                        'Flutter Secure Storage',
                        'Biometrics',
                      ],
                      icon: Icons.lock,
                      color: Colors.amberAccent,
                      isMobile: isMobile,
                      githubUrl:
                          'https://github.com/alielbanna/securevault.git',
                    ),
                  ),
                  SizedBox(
                    width: isMobile ? constraints.maxWidth : itemWidth,
                    child: _buildMiniProjectCard(
                      title: 'Money Master - Personal Finance Tracker',
                      description:
                          'A comprehensive personal finance management application designed to help users track their income and expenses, visualize spending patterns, and manage their budget effectively.',
                      tags: ['Provider', 'SQLite', 'fl_chart'],
                      icon: Icons.attach_money,
                      color: const Color(0xFFFF8A00),
                      isMobile: isMobile,
                      githubUrl:
                          'https://github.com/alielbanna/flutter-finance-tracker.git',
                    ),
                  ),
                  SizedBox(
                    width: isMobile ? constraints.maxWidth : itemWidth,
                    child: _buildMiniProjectCard(
                      title: 'Music Streaming App',
                      description:
                          'A modern, feature-rich music streaming application built with Flutter, following Clean Architecture and Domain-Driven Design (DDD) principles. Experience seamless music playback with a beautiful, intuitive interface.',
                      tags: ['Bloc', 'Hive', 'go_router'],
                      icon: Icons.music_note,
                      color: Colors.purple,
                      isMobile: isMobile,
                      githubUrl:
                          'https://github.com/alielbanna/music_streaming_app.git',
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // ===================== Section Header =====================
  Widget _buildSectionHeader(bool isMobile, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF00D9FF), Color(0xFFFF006E)],
          ).createShader(bounds),
          child: Text(
            'Featured Projects',
            style: TextStyle(
              fontSize: isMobile ? 32 : (isTablet ? 40 : 48),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 12 : 16),
        Text(
          'Building impactful solutions across healthcare, ERP, HRM, and sports industries',
          style: TextStyle(
            fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
            color: Colors.white.withAlpha(180),
          ),
        ),
      ],
    );
  }

  // ===================== Project Card =====================
  Widget _buildProjectCard({
    required String title,
    required String subtitle,
    required String description,
    required List<String> tags,
    required List<String> achievements,
    required IconData icon,
    required Gradient gradient,
    String? googlePlayUrl,
    String? appStoreUrl,
    String? webAppUrl,
    String? websiteUrl,
    required bool isMobile,
    required bool isTablet,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: EdgeInsets.all(isMobile ? 20 : (isTablet ? 24 : 32)),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1F3A).withAlpha(150),
          borderRadius: BorderRadius.circular(isMobile ? 16 : 24),
          border: Border.all(
            color: const Color(0xFF00D9FF).withAlpha(50),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + Icon Row
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(isTablet ? 14 : 16),
                  decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: isTablet ? 28 : 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: isTablet ? 22 : 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: isTablet ? 14 : 16,
                          color: Colors.white.withAlpha(150),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(
                fontSize: isTablet ? 15 : 16,
                color: Colors.white.withAlpha(180),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),

            // Tags
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: tags
                  .map(
                    (tag) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00D9FF).withAlpha(30),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: Color(0xFF00D9FF),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),

            // Action Buttons (Play Store, App Store, Web, Website)
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                if (googlePlayUrl != null)
                  _projectActionButton(
                    icon: Icons.play_arrow,
                    tooltip: 'Open on Google Play',
                    color: const Color(0xFF00D9FF),
                    onTap: () => _openUrl(googlePlayUrl),
                  ),
                if (appStoreUrl != null)
                  _projectActionButton(
                    icon: Icons.apple,
                    tooltip: 'Open on App Store',
                    color: Colors.white,
                    onTap: () => _openUrl(appStoreUrl),
                  ),
                if (webAppUrl != null)
                  _projectActionButton(
                    icon: Icons.public,
                    tooltip: 'Open Web App',
                    color: const Color(0xFF00FFA3),
                    onTap: () => _openUrl(webAppUrl),
                  ),
                if (websiteUrl != null)
                  _projectActionButton(
                    icon: Icons.language,
                    tooltip: 'Visit Website',
                    color: const Color(0xFFFF006E),
                    onTap: () => _openUrl(websiteUrl),
                  ),
              ],
            ),
            const SizedBox(height: 16),

            // Achievements
            Text(
              'Key Achievements',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white.withAlpha(220),
              ),
            ),
            const SizedBox(height: 8),
            ...achievements.map(
              (a) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.only(top: 6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: gradient,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        a,
                        style: TextStyle(
                          color: Colors.white.withAlpha(150),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===================== Mini Project Card =====================
  Widget _buildMiniProjectCard({
    required String title,
    required String description,
    required List<String> tags,
    required IconData icon,
    required Color color,
    required bool isMobile,
    String? githubUrl, // 🔹 Add GitHub URL optional parameter
  }) {
    Future<void> openUrl(String url) async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: EdgeInsets.all(isMobile ? 20 : 24),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1F3A).withAlpha(150),
          borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
          border: Border.all(color: color.withAlpha(70), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withAlpha(40),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: isMobile ? 20 : 24),
                ),
                SizedBox(width: isMobile ? 12 : 16),

                // Title & Description
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: isMobile ? 18 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                // GitHub Button
                // const Spacer(),
                if (githubUrl != null)
                  _projectActionButton(
                    icon: Icons.code,
                    tooltip: 'GitHub Repo',
                    onTap: () => openUrl(githubUrl),
                    color: color,
                  ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              description,
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                color: Colors.white.withAlpha(180),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),

            // Tags
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags
                  .map(
                    (tag) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: color.withAlpha(30),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: color,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  // ===================== Project Action Button =====================
  Widget _projectActionButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onTap,
    required Color color,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: tooltip,
        textStyle: const TextStyle(color: Colors.white), // text color
        decoration: BoxDecoration(
          color: Colors.black87, // dark background
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: color.withAlpha(40),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: color.withAlpha(100)),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
        ),
      ),
    );
  }
}
