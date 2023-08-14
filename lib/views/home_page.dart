import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_pos/views/account.dart';
import 'package:pharmacy_pos/views/dashboard.dart';
import 'package:pharmacy_pos/views/logout.dart';
import 'package:pharmacy_pos/views/profile_screen.dart';
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
    ProfileScreen(),
    LogOutScreen(),
  ];

  /// The currently selected index of the bar
  int selectedIndex = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, constraints) {
          //   final double availableHeight = constraints.maxHeight;
          final screenHeight = MediaQuery.of(context).size.height;
          if (screenHeight <= 600) {
            return Column(
              children: [
                Flexible(
                  child: views.elementAt(selectedIndex),
                ),
                BottomNavigationBar(
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black,
                  showUnselectedLabels: true,
                  selectedLabelStyle: const TextStyle(color: Colors.black),
                  unselectedLabelStyle: const TextStyle(color: Colors.black),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.home,
                        color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.house_fill,
                        color: Colors.black,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.square_grid_2x2,
                        color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.square_grid_2x2_fill,
                        color: Colors.black,
                      ),
                      label: 'Sales',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.chart_pie,
                        color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.chart_pie_fill,
                        color: Colors.black,
                      ),
                      label: 'Reports',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.person_circle,
                        color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.person_circle_fill,
                        color: Colors.black,
                      ),
                      label: 'Profile Screen',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.chart_pie,
                        color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.chart_pie_fill,
                        color: Colors.black,
                      ),
                      label: 'Settings',
                    ),
                    // Add more BottomNavigationBar items as needed
                  ],
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ],
            );
          } else {
            return Row(
              children: [
                NavigationRail(
                  trailing: IconButton(
                    icon: const Icon(
                      CupertinoIcons.arrow_down_right_arrow_up_left,
                    ),
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                  ),
                  extended: isExpanded,
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
                      padding: EdgeInsets.only(top: 5, bottom: 200),
                    ),
                    NavigationRailDestination(
                        icon: Icon(CupertinoIcons.person_circle),
                        selectedIcon: Icon(CupertinoIcons.person_circle_fill),
                        label: Text("Profile Screen"),
                        padding: EdgeInsets.only(top: 5, bottom: 5)),
                    NavigationRailDestination(
                        icon: Icon(
                          CupertinoIcons.chart_pie,
                        ),
                        selectedIcon: Icon(
                          CupertinoIcons.chart_pie_fill,
                        ),
                        label: Text("Settings"),
                        padding: EdgeInsets.only(top: 5, bottom: 5)),
                  ],
                  selectedIndex: selectedIndex,
                ),
                Flexible(
                  child: views.elementAt(selectedIndex),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
