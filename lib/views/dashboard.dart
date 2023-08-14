import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 3,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: 100,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Card(
                    child: Text("${index + 1}"),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
          ),
          const Flexible(
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
