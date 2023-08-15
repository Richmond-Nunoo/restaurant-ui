import 'package:flutter/material.dart';
import 'package:pharmacy_pos/models/food_model.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.orderData,
  });

  final FoodModel orderData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
  }
}
