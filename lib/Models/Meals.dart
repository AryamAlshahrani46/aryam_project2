class Meals{
   String ? idMeal;
   String ? strMeal;
   String ? strMealThumb;

  Meals({
     this.idMeal,
     this.strMeal,
     this.strMealThumb,
  });

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
      idMeal: json["idMeal"] ?? " ",
      strMeal: json["strMeal"] ?? " ",
      strMealThumb: json["strMealThumb"] ?? " ",
    );
  }
}