import 'package:flutter/material.dart';
import 'package:pharmacy_pos/widgets/dotted_lines.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SubTotal",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text("\$37.61")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discounted Sales",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text("\$37.61")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total ",
                        style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
