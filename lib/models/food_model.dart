class FoodModel {
  String foodName;
  String foodDescription;
  double foodPrice;
  String perPeice;
  String imgUrl;

  FoodModel({
    required this.foodName,
    required this.foodDescription,
    required this.foodPrice,
    required this.perPeice,
    required this.imgUrl,
  });
}

List<FoodModel> allFoods = [
  FoodModel(
    foodName: "Almond Brown Sugar Croissant",
    foodDescription: "Sweet croissant with topping, almonds and brown sugar",
    foodPrice: 12.85,
    perPeice: "2 pcs",
    imgUrl: "assets/images/"
  ),
];
