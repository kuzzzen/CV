import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/experience.dart';

class DataService {
  static Future<List<Experience>> loadExperience() async {
    try {
      final String response = await rootBundle.loadString('assets/data/experience.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => Experience.fromJson(json)).toList();
    } catch (e) {
      print('Error loading experience data: $e');
      return [];
    }
  }

  static Future<List<String>> loadTechSkills() async {
    try {
      final String response = await rootBundle.loadString('assets/data/tech_skills.json');
      final List<dynamic> data = json.decode(response);
      return data.map((item) => item.toString()).toList();
    } catch (e) {
      print('Error loading tech skills data: $e');
      return [];
    }
  }
}
