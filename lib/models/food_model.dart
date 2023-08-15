class FoodModel {
  String foodName;
  String foodDescription;
  double foodPrice;
  String perPeice;
  String imgUrl;
  int id;

  FoodModel({
    required this.foodName,
    required this.foodDescription,
    required this.foodPrice,
    required this.perPeice,
    required this.imgUrl,
    required this.id,
  });
}

List<FoodModel> allFoods = [
  FoodModel(
      foodName: "Almond Brown Sugar Croissant",
      foodDescription: "Sweet croissant with topping, almonds and brown sugar",
      foodPrice: 12.85,
      perPeice: "71 pcs",
      imgUrl: "assets/images/2.jpg",
      id: 1),
  FoodModel(
      foodName: "Classic Croissant",
      foodDescription:
          "The classic croissant is a staple and features a flaky, buttery pastry with a crescent shape. It has a light and airy texture with a golden, crispy exterior. The layers are created by repeatedly folding and rolling the dough with butter",
      foodPrice: 19.14,
      perPeice: "6 pcs",
      imgUrl: "assets/images/3.jpg",
      id: 2),
  FoodModel(
      foodName: "Chocolate Croissant",
      foodDescription:
          "Also known as pain au chocolat, the chocolate croissant is a favorite among chocoholics. It consists of a classic croissant with a generous filling of chocolate, usually in the form of chocolate batons or a chocolate-hazelnut spread. When baked, the chocolate melts, creating a gooey and indulgent treat.",
      foodPrice: 11.50,
      perPeice: "28 pcs",
      imgUrl: "assets/images/5.jpg",
      id: 3),
  FoodModel(
      foodName: "Ham and Cheese Croissant",
      foodDescription:
          " This savory croissant is a popular choice for breakfast or brunch. It contains slices of ham and cheese, typically Swiss or Gruyere, which melt and blend into the warm, flaky layers of the croissant. The combination of the savory fillings and the buttery pastry creates a satisfying taste.",
      foodPrice: 13.99,
      perPeice: "14 pcs",
      imgUrl: "assets/images/6.jpg",
      id: 4),
  FoodModel(
      foodName: "Almond Chocolate Croissant",
      foodDescription:
          " A raspberry croissant is a fruity twist on the classic pastry. It is filled with raspberry jam or fresh raspberries, which add a tart and sweet flavor to the buttery croissant. The vibrant red color of the raspberries adds visual appeal to this delicious variation.",
      foodPrice: 8.85,
      perPeice: "1 pcs",
      imgUrl: "assets/images/11.jpg",
      id: 5),
  FoodModel(
      foodName: "Almond Brown Sugar Croissant",
      foodDescription: "Sweet croissant with topping, almonds and brown sugar",
      foodPrice: 19.99,
      perPeice: "21 pcs",
      imgUrl: "assets/images/8.jpg",
      id: 6),
  FoodModel(
    foodName: "Pistachio Croissant",
    foodDescription:
        "A pistachio croissant features a filling made from ground pistachios, sugar, and butter. The filling is generously spread within the croissant and sometimes topped with crushed pistachios. It offers a unique and nutty flavor that pairs well with the flaky and buttery layers.",
    foodPrice: 15.11,
    perPeice: "9 pcs",
    imgUrl: "assets/images/9.jpg",
    id: 7,
  ),
  FoodModel(
    foodName: "Raspberry Croissant",
    foodDescription:
        "This croissant combines the flavors of almonds and chocolate. It is filled with almond cream or frangipane and chocolate, offering a delicious contrast of textures and flavors. The combination of the nutty almond filling and the sweet chocolate makes for a delightful treat.",
    foodPrice: 12.12,
    perPeice: "2 pcs",
    imgUrl: "assets/images/10.jpg",
    id: 8,
  ),
];

List<FoodModel> currentOrder = [
  FoodModel(
    foodName: "Cheese Croissant",
    foodDescription:
        " A cheese croissant is a savory variation that features a filling made with a blend of cheese, typically Gruyere, Emmental, or cheddar.",
    foodPrice: 10.01,
    perPeice: "22 pcs",
    imgUrl: "assets/images/1.jpg",
    id: 11,
  ),
  FoodModel(
    foodName: "Matcha Croissant",
    foodDescription:
        "Matcha croissants are gaining popularity for their unique flavor and vibrant green color.",
    foodPrice: 22.02,
    perPeice: "12 pcs",
    imgUrl: "assets/images/7.jpg",
    id: 12,
  ),
  FoodModel(
    foodName: "Savory Spinach and Feta Croissant",
    foodDescription:
        "This croissant is filled with a savory mixture of sautéed spinach and crumbled feta cheese. ",
    foodPrice: 5.58,
    perPeice: "34 pcs",
    imgUrl: "assets/images/12.jpg",
    id: 13,
  ),
];
