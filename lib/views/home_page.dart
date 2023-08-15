import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_pos/views/user_reports.dart';
import 'package:pharmacy_pos/views/user_dashboard.dart';
import 'package:pharmacy_pos/views/user_settings.dart';
import 'package:pharmacy_pos/views/user_profile.dart';
import 'package:pharmacy_pos/views/user_food_menu.dart';
import 'package:window_manager/window_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WindowListener {
  late bool isPreventClose;
  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    preventValue();
    _init();
  }

  void preventValue() async {
    isPreventClose = await windowManager.isPreventClose();
  }

  void _init() async {
    await windowManager.setPreventClose(true);
    setState(() {});
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowEvent(String eventName) {
    print('[WindowManager] onWindowEvent: $eventName');
  }

  @override
  void onWindowClose() async {
    final currentContext = context; // Store the context reference
    if (isPreventClose) {
      showDialog(
        context: currentContext,
        builder: (_) {
          return AlertDialog(
            title: const Text('Are you sure you want to close this window?'),
            actions: [
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await windowManager.destroy();
                },
              ),
            ],
          );
        },
      );
    }
  }

  List<Widget> views = const [
    DashBoard(),
    FoodMenu(),
    ReportsScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  int selectedIndex = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, constraints) {
          final screenHeight = MediaQuery.of(context).size.height;
          if (screenHeight <= 600) {
            return Column(
              children: [
                Expanded(
                  child: views.elementAt(selectedIndex),
                ),
                BottomNavigationBar(
                  iconSize: 20,
                  elevation: 10,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.home,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.house_fill,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.square_grid_2x2,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.square_grid_2x2_fill,
                      ),
                      label: 'Sales',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.chart_pie,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.chart_pie_fill,
                      ),
                      label: 'Reports',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.person_circle,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.person_circle_fill,
                      ),
                      label: 'Profile ',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.gear,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.gear_alt_fill,
                      ),
                      label: 'Settings',
                    ),
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
                  selectedLabelTextStyle: const TextStyle(color: Colors.orange),
                  minExtendedWidth: 140,
                  elevation: 10,
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
                        size: 20,
                      ),
                      selectedIcon: Icon(
                        CupertinoIcons.house_fill,
                        color: Colors.orange,
                      ),
                      label: Text("Home"),
                      padding: EdgeInsets.only(top: 40, bottom: 0),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        CupertinoIcons.square_grid_2x2,
                        size: 20,
                      ),
                      selectedIcon: Icon(
                        CupertinoIcons.square_grid_2x2_fill,
                        color: Colors.orange,
                      ),
                      label: Text("Sales"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        CupertinoIcons.chart_pie,
                      ),
                      selectedIcon: Icon(
                        CupertinoIcons.chart_pie_fill,
                        color: Colors.orange,
                      ),
                      label: Text("Reports"),
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                    ),
                    NavigationRailDestination(
                      icon: Icon(CupertinoIcons.person_circle),
                      selectedIcon: Icon(
                        CupertinoIcons.person_circle_fill,
                        color: Colors.orange,
                      ),
                      label: Text("Profile "),
                    ),
                    NavigationRailDestination(
                        icon: Icon(
                          CupertinoIcons.gear,
                        ),
                        selectedIcon: Icon(
                          CupertinoIcons.gear_alt_fill,
                          color: Colors.orange,
                        ),
                        label: Text("Settings"),
                        padding: EdgeInsets.only(top: 5, bottom: 0)),
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
