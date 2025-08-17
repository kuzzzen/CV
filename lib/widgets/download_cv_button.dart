import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DownloadCVButton extends StatelessWidget {
  const DownloadCVButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
      child: TextButton(
        onPressed: () {
          launchUrlString("Kasatkin_CV.pdf");
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.hovered)) {
              return Colors.white;
            }
            return Colors.black;
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.hovered)) {
              return Colors.black;
            }
            return Colors.white;
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.black, width: 2),
            ),
          ),
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        child: Text(
          "Download CV",
          style: GoogleFonts.instrumentSerif(
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
