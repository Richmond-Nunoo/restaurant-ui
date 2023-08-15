
import 'package:flutter/material.dart';

class WelcomeUserSearchWidget extends StatelessWidget {
  const WelcomeUserSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: const TextField(
            textInputAction: TextInputAction.none,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
              ),
              border: InputBorder.none,
              labelText: "Search Product....",
              labelStyle: TextStyle(fontSize: 13),
            ),
          ),
        )
      ],
    );
  }
}
