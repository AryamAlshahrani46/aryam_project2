import 'package:flutter/material.dart';
import 'package:aryam_project2/Models/Meal_Category.dart';
import 'package:aryam_project2/Services/Api.dart';
import 'package:aryam_project2/Screens/AboutApp_Screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class MealsScreen extends StatelessWidget {
  String? categoryName;

  MealsScreen({super.key, this.categoryName});

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
                MaterialPageRoute(builder: (context) => AboutAppScreen()),
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
              "Choose your meal",
              style: GoogleFonts.tajawal(
                color: Color(0xFF5D3A1A),
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),

            Expanded(
              child: FutureBuilder(
                future: ApiMeals().getMeals(categoryName ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: LoadingAnimationWidget.flickr(
                        leftDotColor: Color(0xFFE67E22),
                        rightDotColor: Color(0xFF5D3A1A),
                        size: 100,
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    var allMeals = snapshot.data;

                    return GridView.builder(
                      itemCount: allMeals!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) {
                        var meal = allMeals[index];

                        return Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                meal.strMealThumb ?? " ",
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(height: 7.0),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  meal.strMeal ?? " ",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.tajawal(
                                    color: Color(0xFF5D3A1A),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
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
              icon:  Icon(
                Icons.home_rounded,
                color: Color(0xFFE67E22),
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon:  Icon(
                Icons.favorite_border_outlined,
                color: Color(0xFFE67E22),
                size: 26,
              ),
            ),

            IconButton(
              onPressed: () {},
              icon:  Icon(
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
