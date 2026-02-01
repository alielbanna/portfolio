import 'package:flutter/material.dart';
import '../widgets/animated_gradient_background.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/custom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    'home': GlobalKey(),
    'about': GlobalKey(),
    'skills': GlobalKey(),
    'projects': GlobalKey(),
    'experience': GlobalKey(),
    'contact': GlobalKey(),
  };

  late AnimationController _floatingController;
  bool _showNavBar = false;

  @override
  void initState() {
    super.initState();
    _floatingController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _scrollController.addListener(() {
      if (_scrollController.offset > 100 && !_showNavBar) {
        setState(() => _showNavBar = true);
      } else if (_scrollController.offset <= 100 && _showNavBar) {
        setState(() => _showNavBar = false);
      }
    });
  }

  @override
  void dispose() {
    _floatingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    final key = _sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated background
          const AnimatedGradientBackground(),

          // Main content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Hero Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['home'],
                  child: HeroSection(
                    onScrollToProjects: () => _scrollToSection('projects'),
                    floatingAnimation: _floatingController,
                  ),
                ),
              ),

              // About Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['about'],
                  child: const AboutSection(),
                ),
              ),

              // Skills Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['skills'],
                  child: const SkillsSection(),
                ),
              ),

              // Projects Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['projects'],
                  child: const ProjectsSection(),
                ),
              ),

              // Experience Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['experience'],
                  child: const ExperienceSection(),
                ),
              ),

              // Contact Section
              SliverToBoxAdapter(
                child: Container(
                  key: _sectionKeys['contact'],
                  child: const ContactSection(),
                ),
              ),

              // Footer
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  alignment: Alignment.center,
                  child: Text(
                    '© 2026 Ali Ramadan El Banna. Built with Flutter 💙',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Floating Navigation Bar
          if (_showNavBar)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomNavigationBar(
                onNavigate: _scrollToSection,
              ),
            ),
        ],
      ),
    );
  }
}