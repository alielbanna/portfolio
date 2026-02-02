import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

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
          // Section Title
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFFFF006E)],
            ).createShader(bounds),
            child: Text(
              'Get In Touch',
              style: TextStyle(
                fontSize: isMobile ? 32 : (isTablet ? 40 : 48),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'I\'m currently available for freelance work and full-time opportunities',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withAlpha(180),
            ),
          ),
          const SizedBox(height: 60),

          // Contact cards
          isMobile
              ? Column(
            children: [
              _buildContactCard(
                icon: Icons.email,
                title: 'Email',
                value: 'alielbana6662@gmail.com',
                color: const Color(0xFF00D9FF),
                onTap: () => _launchEmail,
              ),
              const SizedBox(height: 20),
              _buildContactCard(
                icon: Icons.phone,
                title: 'Phone',
                value: '+20 112 993 7838',
                color: const Color(0xFF00FFA3),
                onTap: () => _launchPhone,
              ),
              const SizedBox(height: 20),
              _buildContactCard(
                icon: Icons.location_on,
                title: 'Location',
                value: 'El Menoufia, Egypt',
                color: const Color(0xFFFF006E),
                onTap: () {},
              ),
            ],
          )
              : Row(
            children: [
              Expanded(
                child: _buildContactCard(
                  icon: Icons.email,
                  title: 'Email',
                  value: 'alielbana6662@gmail.com',
                  color: const Color(0xFF00D9FF),
                  onTap: () => _launchEmail,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildContactCard(
                  icon: Icons.phone,
                  title: 'Phone',
                  value: '+20 112 993 7838',
                  color: const Color(0xFF00FFA3),
                  onTap: () => _launchPhone,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildContactCard(
                  icon: Icons.location_on,
                  title: 'Location',
                  value: 'El Menoufia, Egypt',
                  color: const Color(0xFFFF006E),
                  onTap: () {},
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          // Call to Action + Socials
          Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00D9FF), Color(0xFF00FFA3)],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00D9FF).withAlpha(50),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Let\'s Build Something Amazing',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A0E27),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'I\'m always interested in hearing about new projects and opportunities',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xFF0A0E27).withAlpha(180),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildSocialButton(
                        icon: Icons.code,
                        label: 'GitHub',
                        url: 'https://github.com/alielbanna',
                        color: const Color(0xFF000000),
                      ),
                      _buildSocialButton(
                        icon: Icons.work,
                        label: 'LinkedIn',
                        url: 'https://linkedin.com/in/ali-elbanna',
                        color: const Color(0xFF0A66C2),
                      ),
                      // _buildSocialButton(
                      //   icon: Icons.language,
                      //   label: 'Website',
                      //   url: 'https://alielbana.dev',
                      //   color: const Color(0xFFFF006E),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1F3A).withAlpha(150),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: color.withAlpha(70),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withAlpha(150),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required String url,
    required Color color,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
