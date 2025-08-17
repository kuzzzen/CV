import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'header_section.dart';
import 'experience_section.dart';
import 'tech_skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double _pageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    setState(() {
      _pageValue = _pageController.page ?? 0.0;
    });
  }

  double _getOpacityForSection(int sectionIndex) {
    double distance = (_pageValue - sectionIndex).abs();

    if (distance < 0.5) {
      // Fade in/out during transition
      return 1.0 - distance * 2.0;
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          // First section: Header
          SizedBox(
            height: screenHeight,
            child: Opacity(
              opacity: _getOpacityForSection(0),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: screenHeight * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeaderSection(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Scroll down to see CV",
                          style: GoogleFonts.instrumentSerif(
                            textStyle: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Second section: Experience
          Opacity(
            opacity: _getOpacityForSection(1),
            child: ExperienceSection(),
          ),
          // Third section: Tech Skills
          Opacity(
            opacity: _getOpacityForSection(2),
            child: TechSkillsSection(),
          ),
        ],
      ),
    );
  }
}
