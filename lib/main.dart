import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/home_page.dart';
import 'widgets/download_cv_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nikita Kasatkin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Nikita Kasatkin'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const DownloadCVButton(),
      body: HomePage(title: title),
    );
  }
}
