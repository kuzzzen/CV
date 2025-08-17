import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/data_service.dart';

class TechSkillsSection extends StatefulWidget {
  const TechSkillsSection({super.key});

  @override
  State<TechSkillsSection> createState() => _TechSkillsSectionState();
}

class _TechSkillsSectionState extends State<TechSkillsSection> {
  List<String> _techSkills = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTechSkills();
  }

  Future<void> _loadTechSkills() async {
    final techSkills = await DataService.loadTechSkills();
    setState(() {
      _techSkills = techSkills;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tech Skills",
                style: GoogleFonts.instrumentSerif(
                  textStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _techSkills.map((skill) => _buildSkillItem(skill)).toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillItem(String skill) {
    return Text(
      skill,
      style: GoogleFonts.instrumentSerif(
        textStyle: TextStyle(
          fontSize: 18,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
