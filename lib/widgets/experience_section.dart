import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/experience.dart';
import '../services/data_service.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  List<Experience> _experiences = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExperiences();
  }

  Future<void> _loadExperiences() async {
    final experiences = await DataService.loadExperience();
    setState(() {
      _experiences = experiences;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      padding: EdgeInsets.all(40),
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Section header
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Experience",
                  style: GoogleFonts.instrumentSerif(
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Scrollable content
              Container(
                height: screenHeight * 0.6,
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ..._buildGroupedExperiences(),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Tech skills",
                                      style: GoogleFonts.instrumentSerif(
                                        textStyle: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_downward_sharp,
                                      size: 20,
                                    ),
                                  ],
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
      ),
    );
  }

  List<Widget> _buildGroupedExperiences() {
    List<Widget> widgets = [];
    
    for (int i = 0; i < _experiences.length; i++) {
      Experience experience = _experiences[i];
      bool showCompanyHeader = i == 0 || _experiences[i - 1].company != experience.company;
      
      if (showCompanyHeader) {
        // Add company header
        widgets.add(
          Row(
            children: [
              Text(
                "${experience.company} ",
                style: GoogleFonts.instrumentSerif(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                experience.location,
                style: GoogleFonts.instrumentSerif(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        );
        widgets.add(SizedBox(height: 10));
      }
      
      // Add position and period
      widgets.add(
        Row(
          children: [
            Text(
              "${experience.position} ",
              style: GoogleFonts.instrumentSerif(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              experience.period,
              style: GoogleFonts.instrumentSerif(
                textStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
      widgets.add(SizedBox(height: 10));
      
      // Add description
      widgets.add(
        Text(
          experience.description,
          style: GoogleFonts.instrumentSerif(
            textStyle: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
            ),
          ),
        ),
      );
      
      // Add spacing between experiences (but not after the last one)
      if (i < _experiences.length - 1) {
        widgets.add(SizedBox(height: 30));
      }
    }
    
    return widgets;
  }
}
