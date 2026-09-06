class MealCategory {
   String ? idCategory;
   String ? strCategory;
   String ? strCategoryThumb;

  MealCategory({
     this.idCategory,
     this.strCategory,
     this.strCategoryThumb,
  });

  factory MealCategory.fromJson(Map<String, dynamic> json) {
    return MealCategory(
      idCategory: json["idCategory"] ?? " ",
      strCategory: json["strCategory"] ?? " ",
      strCategoryThumb: json["strCategoryThumb"] ?? " ",
    );
  }
}