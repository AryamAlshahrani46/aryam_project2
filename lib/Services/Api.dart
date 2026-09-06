import 'dart:convert';
import 'package:aryam_project2/Models/Meal_Category.dart';
import 'package:aryam_project2/Models/Meals.dart';
import 'package:http/http.dart' as http;

class ApiCategory {
  String link = "https://www.themealdb.com/api/json/v1/1/categories.php";

  Future<List<MealCategory>> getMealCategories() async {
    var uri = Uri.parse(link);

    var response = await http.get(uri);
    var body = response.body;
    var bodyResponse = jsonDecode(body);

    List<MealCategory> listData = [];

    for (var item in bodyResponse["categories"]) {
      MealCategory model = MealCategory.fromJson(item);
      listData.add(model);
    }
    return listData;
  }
}

class ApiMeals {
  Future<List<Meals>> getMeals(String category) async {
    String link =
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=${category}";

    var uri = Uri.parse(link);

    var response = await http.get(uri);
    var body = response.body;
    var bodyResponse = jsonDecode(body);

    List<Meals> listData = [];

    for (var item in bodyResponse["meals"]) {
      Meals model = Meals.fromJson(item);
      listData.add(model);
    }
    return listData;
  }
}
