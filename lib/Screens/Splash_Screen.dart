import 'package:flutter/material.dart';
import 'package:aryam_project2/Screens/List_Screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Container(
       width: double.infinity,
  height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Splash Screen.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  " My Meals ",
                  style: GoogleFonts.amiri(
                    color: Color.fromARGB(255, 227, 218, 183),
                    fontSize: 32,
                    fontWeight: FontWeight.w100,
                  ),
                ),

                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        "Save Money",
                        style: GoogleFonts.tajawal(
                          color: Color.fromARGB(255, 227, 218, 183),
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.0),
                    Padding(
                      padding: EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Cook More",
                        style: GoogleFonts.tajawal(
                          color: Color.fromARGB(255, 227, 218, 183),
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.0),
                    Padding(
                      padding: EdgeInsets.only(left: 120.0),
                      child: Text(
                        "Enjoy Better",
                        style: GoogleFonts.tajawal(
                          color: Color.fromARGB(255, 227, 218, 183),
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7A00),
                    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
