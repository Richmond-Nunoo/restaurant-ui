import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                            text: "",
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
                          height: 50,
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
                                labelStyle: TextStyle(fontSize: 16)),
                          ),
                        )
                      ],
                    ),

                    
                  ],
                ),
              )
              // ListView.separated(
              //   physics: const BouncingScrollPhysics(),
              //   itemCount: 100,
              //   itemBuilder: (context, index) {
              //     return SizedBox(
              //       height: 50,
              //       width: double.infinity,
              //       child: Card(
              //         child: Text("${index + 1}"),
              //       ),
              //     );
              //   },
              //   separatorBuilder: (BuildContext context, int index) {
              //     return const SizedBox(
              //       height: 10,
              //     );
              //   },
              // ),
              ),
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
