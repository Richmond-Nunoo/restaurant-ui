import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_pos/widgets/dotted_lines.dart';

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
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
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
                                return Container(
                                  // height: 220,
                                  // width: 160,
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
                                    borderRadius: BorderRadius.circular(5),
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
                                                    fontSize: 9,
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
                                                          fontWeight:
                                                              FontWeight.w500,
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
                        return ListTile(
                          // isThreeLine: true,
                          minVerticalPadding: 0,
                          leading: Container(
                            height: 50,
                            width: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage(orderData.imgUrl),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          title: Text(
                            orderData.foodName,
                            style: const TextStyle(fontSize: 10),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${orderData.foodPrice}",
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 11,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 11,
                                    width: 11,
                                    color: Colors.orange,
                                    child: const Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text("1"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 11,
                                    width: 11,
                                    color: Colors.orange,
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.loose,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "SubTotal",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text("\$37.61")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Discounted Sales",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text("\$37.61")
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Sales Tax",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text("\$37.61")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomPaint(
                              painter: DrawDottedhorizontalline(),
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("\$37.61")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -10,
                        top: MediaQuery.of(context).size.height * 0.15,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        left: -5,
                        top: MediaQuery.of(context).size.height * 0.15,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
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
