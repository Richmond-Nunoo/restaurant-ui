import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/food_model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List category = [
    {
      "Icon": Icons.breakfast_dining,
      "name": "All Desserts",
    },
    {
      "Icon": CupertinoIcons.leaf_arrow_circlepath,
      "name": "Croissants",
    },
    {
      "Icon": Icons.coffee_maker,
      "name": "Coffee",
    },
    {
      "Icon": Icons.icecream_outlined,
      "name": "Ice Creams",
    },
    {
      "Icon": Icons.water,
      "name": "Signature",
    }
  ];

  int initialSelectedItem = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: " ",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                  text: "Welcome, Gorry \n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                text: "Discover whatever you need easily",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const TextField(
                            textInputAction: TextInputAction.none,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                ),
                                border: InputBorder.none,
                                labelText: "Search Product....",
                                labelStyle: TextStyle(fontSize: 13)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        category.length,
                        (index) {
                          final data = category[index];
                          final isSelected = index == initialSelectedItem;

                          return SizedBox(
                            height: 40,
                            width: 110,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  initialSelectedItem = index;
                                });
                              },
                              child: Card(
                                color:
                                    isSelected ? Colors.orange : Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        data["Icon"],
                                        size: 16,
                                      ),
                                      Text(data["name"])
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (initialSelectedItem == 0)
                      const Expanded(
                          child: Center(child: Text("All Desserts"))),
                    if (initialSelectedItem == 1)
                      Expanded(
                          child: GridView.builder(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              itemCount: allFoods.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 25,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.58,
                              ),
                              itemBuilder: (context, index) {
                                final foodData = allFoods[index];
                                return Container(
                                  height: 220,
                                  width: 160,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), // Shadow color
                                        spreadRadius: 4, // Spread radius
                                        blurRadius: 4, // Blur radius
                                        offset: const Offset(0, 3), // Offset
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      foodData.imgUrl)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              foodData.foodName,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Spacer(),
                                            Wrap(
                                              children: [
                                                Text(
                                                  foodData.foodDescription,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w200,
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            RichText(
                                              text: TextSpan(
                                                text: "",
                                                style: const TextStyle(
                                                    fontSize: 14),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          "\$${foodData.foodPrice}",
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.orange)),
                                                  TextSpan(
                                                      text:
                                                          " / ${foodData.perPeice}",
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })),
                    if (initialSelectedItem == 2)
                      Expanded(child: Text("Coffee"))
                  ],
                ),
              )),
          const Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Card(
                child: Text("Cart"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
