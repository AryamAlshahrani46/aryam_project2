import 'package:flutter/material.dart';
import 'package:aryam_project2/Models/Meal_Category.dart';
import 'package:aryam_project2/Services/Api.dart';
import 'package:aryam_project2/Screens/Meals_Screen.dart';
import 'package:aryam_project2/Screens/AboutApp_Screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFDF8EC),
        scrolledUnderElevation: 0,
        centerTitle: true,

        leading: Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: Image.asset(
            "assets/Logo.png",
            width: 40.0,
            height: 40.0,
            fit: BoxFit.contain,
          ),
        ),

        title: Text(
          "My Meals",
          style: GoogleFonts.amiri(
            color: Color(0xFF5D3A1A),
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info, color: Color(0xFFE67E22), size: 26),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AboutAppScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Color(0xFFE67E22), size: 28),
            onPressed: () {},
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 236, 228, 205),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Text(
              "What do you want to cook today?",
              style: GoogleFonts.tajawal(
                color: Color(0xFF5D3A1A),
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16),

            Expanded(
              child: FutureBuilder(
                future: ApiCategory().getMealCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: LoadingAnimationWidget.flickr(
                        leftDotColor: const Color(0xFFE67E22),
                        rightDotColor: const Color(0xFF5D3A1A),
                        size: 100,
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    var allCategories = snapshot.data;
                  
                    return GridView.builder(
                      itemCount: allCategories!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        var category = allCategories[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MealsScreen(
                                  categoryName: category.strCategory ?? " ",
                                ),
                              ),
                            );
                          },

                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  category.strCategoryThumb!,
                                  width: 90,
                                  height: 90,
                                ),
                                Text(
                                  category.strCategory!,
                                  style: GoogleFonts.tajawal(
                                    color: Color(0xFF5D3A1A),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Text("NO DATA");
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(color: Color(0xFFFDF8EC)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home_rounded,
                color: Color(0xFFE67E22),
                size: 28,
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_outlined,
                color: Color(0xFFE67E22),
                size: 26,
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_2_outlined,
                color: Color(0xFFE67E22),
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
