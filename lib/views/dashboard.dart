import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Row(
        children: [
          Flexible(
            flex: 3,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: 100,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  height: 50,
                  width: double.infinity,
                  child: Text("${index + 1}"),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
          ),
          Flexible(
            child: Container(
              height: double.maxFinite,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
