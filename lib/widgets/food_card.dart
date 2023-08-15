
import 'package:flutter/material.dart';
import 'package:pharmacy_pos/models/food_model.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.foodData,
  });

  final FoodModel foodData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(0, 3),
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
                      fit: BoxFit.cover, image: AssetImage(foodData.imgUrl)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    style: const TextStyle(fontSize: 14),
                    children: [
                      TextSpan(
                          text: "\$${foodData.foodPrice}",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange)),
                      TextSpan(
                          text: " / ${foodData.perPeice}",
                          style: const TextStyle(
                              fontSize: 10, color: Colors.black)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
