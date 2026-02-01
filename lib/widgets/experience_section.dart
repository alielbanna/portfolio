import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final isTablet = size.width >= 600 && size.width < 1024;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFFFF006E)],
            ).createShader(bounds),
            child: Text(
              'Experience',
              style: TextStyle(
                fontSize: isMobile ? 32 : (isTablet ? 40 : 48),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 60),

          // Experience cards
          _buildExperienceCard(
            company: 'Hash Studio',
            position: 'Flutter Developer',
            period: 'August 2023 – August 2025',
            location: 'Shebin El Kom, El Menoufia',
            highlights: [
              'Developed and maintained 5 cross-platform mobile applications achieving 99.5% crash-free rate',
              'Implemented Clean Architecture principles reducing code complexity by 40%',
              'Optimized application performance reducing app load time by 35%',
              'Mentored junior developer and established team coding standards reducing bug reports by 30%',
              'Integrated Firebase services for real-time data synchronization and authentication',
            ],
            color: const Color(0xFF00D9FF),
            icon: Icons.business,
            isMobile: isMobile,
          ),
          const SizedBox(height: 32),
          _buildExperienceCard(
            company: 'Self-Employed',
            position: 'Freelance Flutter Developer',
            period: 'September 2025 – Present',
            location: 'Remote',
            highlights: [
              'Deliver end-to-end mobile application solutions for clients across sports, healthcare, and finance industries',
              'Lead development teams of 3-5 developers, coordinating sprint planning and code reviews',
              'Published multiple applications on Google Play Store with 4.5+ average rating',
              'Architect scalable applications using Clean Architecture with MVVM pattern',
              '100% client satisfaction across 4+ completed projects',
            ],
            color: const Color(0xFF00FFA3),
            icon: Icons.person,
            isMobile: isMobile,
          ),

        ],
      ),
    );
  }

  Widget _buildExperienceCard({
    required String company,
    required String position,
    required String period,
    required String location,
    required List<String> highlights,
    required Color color,
    required IconData icon,
    required bool isMobile,
  }) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F3A).withAlpha(150),
        borderRadius: BorderRadius.circular(isMobile ? 16 : 24),
        border: Border.all(
          color: color.withAlpha(70),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withAlpha(50),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Tooltip(
                      message: position,
                      textStyle: const TextStyle(color: Colors.white),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        position,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Tooltip(
                      message: company,
                      textStyle: const TextStyle(color: Colors.white),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        company,
                        style: TextStyle(
                          fontSize: 18,
                          color: color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Period and location
          Wrap(
            children: [
              Icon(Icons.calendar_today,
                  size: 16, color: Colors.white.withAlpha(150)),
              const SizedBox(width: 8),
              Text(
                period,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withAlpha(150),
                ),
              ),
              const SizedBox(width: 24),
              Icon(Icons.location_on,
                  size: 16, color: Colors.white.withAlpha(150)),
              const SizedBox(width: 8),
              Text(
                location,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withAlpha(150),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Highlights
          ...highlights.map((highlight) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      highlight,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withAlpha(200),
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
