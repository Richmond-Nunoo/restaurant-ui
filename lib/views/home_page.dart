import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_pos/views/account.dart';
import 'package:pharmacy_pos/views/dashboard.dart';
import 'package:pharmacy_pos/views/settings.dart';
import 'package:side_navigation/side_navigation.dart';

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
            onDestinationSelected: (value) => selectedIndex,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(
                    CupertinoIcons.home,
                  ),
                  selectedIcon: Icon(
                    CupertinoIcons.house_fill,
                  ),
                  label: Text("Home"),
                  padding: EdgeInsets.all(10)),
              NavigationRailDestination(
                  icon: Icon(
                    CupertinoIcons.square_grid_2x2,
                  ),
                  selectedIcon: Icon(
                    CupertinoIcons.square_grid_2x2_fill,
                  ),
                  label: Text("Sales"),
                  padding: EdgeInsets.all(10)),
              NavigationRailDestination(
                  icon: Icon(
                    CupertinoIcons.chart_pie,
                  ),
                  selectedIcon: Icon(
                    CupertinoIcons.chart_pie_fill,
                  ),
                  label: Text("Reports"),
                  padding: EdgeInsets.all(10)),
            ],
            selectedIndex: selectedIndex,
          ),
          // SideNavigationBar(
          //   header: const SideNavigationBarHeader(
          //     image: FlutterLogo(),
          //     title: Text(""),
          //     subtitle: Text(""),
          //   ),
          //   initiallyExpanded: false,
          //   selectedIndex: selectedIndex,
          //   items: const [
          //     SideNavigationBarItem(
          //       icon: CupertinoIcons.home,
          //       label: 'Dashboard',
          //     ),
          //     SideNavigationBarItem(
          //       icon: Icons.person,
          //       label: 'Account',
          //     ),
          //     SideNavigationBarItem(
          //       icon: Icons.settings,
          //       label: 'Settings',
          //     ),
          //   ],
          //   onTap: (index) {
          //     setState(() {
          //       selectedIndex = index;
          //     });
          //   },
          // ),
          Expanded(
            flex: 2,
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
