import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_pos/widgets/food_card.dart';
import 'package:pharmacy_pos/widgets/order_card.dart';
import 'package:pharmacy_pos/widgets/order_summary.dart';
import 'package:pharmacy_pos/widgets/welcome_user_search.dart';

import '../models/food_model.dart';

class FoodMenu extends StatefulWidget {
  const FoodMenu({super.key});

  @override
  State<FoodMenu> createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
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
                    const WelcomeUserSearchWidget(),
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
                        child: Center(
                          child: Text("All Desserts"),
                        ),
                      ),
                    if (initialSelectedItem == 1)
                      Expanded(
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              itemCount: allFoods.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.55,
                              ),
                              itemBuilder: (context, index) {
                                final foodData = allFoods[index];
                                return FoodCard(foodData: foodData);
                              })),
                    if (initialSelectedItem == 2)
                      const Expanded(child: Center(child: Text("Coffee"))),
                    if (initialSelectedItem == 3)
                      const Expanded(child: Center(child: Text("Ice Creams"))),
                    if (initialSelectedItem == 4)
                      const Expanded(child: Center(child: Text("Signature"))),
                  ],
                ),
              )),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              color: Colors.white,
              height: double.maxFinite,
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Current Order"),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: currentOrder.length,
                      itemBuilder: (context, index) {
                        final orderData = currentOrder[index];
                        return OrderCard(orderData: orderData);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
                  const OrderSummary(),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 30)),
                        maximumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 30)),
                        fixedSize: MaterialStateProperty.all(
                            const Size(double.infinity, 30))),
                    child: const Text(
                      "Continue to Payment",
                      style: TextStyle(fontSize: 10),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
