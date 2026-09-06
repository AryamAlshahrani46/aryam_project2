import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF8EC),
      appBar: AppBar(
        backgroundColor: Color(0xFFFDF8EC),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Color(0xFF5D3A1A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Image.asset(
          "assets/Logo.png",
          width: 55,
          height: 55,
          fit: BoxFit.contain,
        ),
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.0),
          child: Card(
            color:  Color(0xFFFDF8EC),
            elevation: 4,

            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "About The App",
                    style: GoogleFonts.amiri(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color:  Color(0xFF5D3A1A),
                    ),
                  ),
                   SizedBox(height: 16),
                  Text(
                    "Welcome to My Meals! Your primary destination to discover delicious recipes, explore various food categories, and easily organize your daily meals.",
                    style: GoogleFonts.tajawal(
                      fontSize: 16,
                      height: 1.6,
                      color:  Color(0xFF5D3A1A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
