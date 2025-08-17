import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/link_with_hover.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use Row for larger screens, Column for smaller screens
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        "Nikita ",
                        style: GoogleFonts.instrumentSerif(
                          textStyle: TextStyle(fontSize: 62),
                        ),
                      ),
                      Text(
                        "Kasatkin",
                        style: GoogleFonts.instrumentSerif(
                          textStyle: TextStyle(fontSize: 62),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "C++ Developer",
                    style: GoogleFonts.instrumentSerif(
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Prague, Czechia",
                    style: GoogleFonts.instrumentSerif(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    "+420 608737894",
                    style: GoogleFonts.instrumentSerif(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  LinkWithHover(
                    "n.kasatkin@proton.me",
                    link: "mailto:n.kasatkin@proton.me",
                    style: GoogleFonts.instrumentSerif(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  LinkWithHover(
                    "LinkedIn",
                    link: "https://www.linkedin.com/in/kuzen/",
                    style: GoogleFonts.instrumentSerif(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          // Stack vertically on smaller screens
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Nikita ",
                        style: GoogleFonts.instrumentSerif(
                          textStyle: TextStyle(fontSize: 62),
                        ),
                      ),
                      Text(
                        "Kasatkin",
                        style: GoogleFonts.instrumentSerif(
                          textStyle: TextStyle(fontSize: 62),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "C++ Developer",
                    style: GoogleFonts.instrumentSerif(
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Prague, Czechia",
                    style: GoogleFonts.instrumentSerif(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    "+420 608737894",
                    style: GoogleFonts.instrumentSerif(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  LinkWithHover(
                    "n.kasatkin@proton.me",
                    link: "mailto:n.kasatkin@proton.me",
                    style: GoogleFonts.instrumentSerif(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  LinkWithHover(
                    "LinkedIn",
                    link: "https://www.linkedin.com/in/kuzen/",
                    style: GoogleFonts.instrumentSerif(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
