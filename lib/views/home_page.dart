import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_pos/views/account.dart';
import 'package:pharmacy_pos/views/dashboard.dart';
import 'package:pharmacy_pos/views/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> views = const [
    DashBoard(),
    SettingsScreen(),
    AccountsScreen(),
  ];

  /// The currently selected index of the bar
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            leading: const FlutterLogo(),
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(
                  CupertinoIcons.home,
                ),
                selectedIcon: Icon(
                  CupertinoIcons.house_fill,
                ),
                label: Text("Home"),
                padding: EdgeInsets.only(top: 50, bottom: 10),
              ),
              NavigationRailDestination(
                  icon: Icon(
                    CupertinoIcons.square_grid_2x2,
                  ),
                  selectedIcon: Icon(
                    CupertinoIcons.square_grid_2x2_fill,
                  ),
                  label: Text("Sales"),
                  padding: EdgeInsets.all(5)),
              NavigationRailDestination(
                  icon: Icon(
                    CupertinoIcons.chart_pie,
                  ),
                  selectedIcon: Icon(
                    CupertinoIcons.chart_pie_fill,
                  ),
                  label: Text("Reports"),
                  padding: EdgeInsets.all(5)),
            ],
            selectedIndex: selectedIndex,
          ),
          Expanded(
            flex: 3,
            child: views.elementAt(selectedIndex),
          ),
          Expanded(
            child: Container(
              height: double.maxFinite,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
