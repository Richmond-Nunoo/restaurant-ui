import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_pos/views/account.dart';
import 'package:pharmacy_pos/views/dashboard.dart';
import 'package:pharmacy_pos/views/logout.dart';
import 'package:pharmacy_pos/views/profile_screen.dart';
import 'package:pharmacy_pos/views/settings.dart';
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
    SettingsScreen(),
    AccountsScreen(),
    ProfileScreen(),
    LogOutScreen(),
  ];

  /// The currently selected index of the bar
  int selectedIndex = 0;
  bool isExpanded = false;

  bool themevalue = false;
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
                        //   color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.house_fill,
                        // color: Colors.black,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.square_grid_2x2,
                        //   color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.square_grid_2x2_fill,
                        //  color: Colors.black,
                      ),
                      label: 'Sales',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.chart_pie,
                        //  color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.chart_pie_fill,
                        //   color: Colors.black,
                      ),
                      label: 'Reports',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.person_circle,
                        //    color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.person_circle_fill,
                        //   color: Colors.black,
                      ),
                      label: 'Profile Screen',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.chart_pie,
                        //    color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.chart_pie_fill,
                        //    color: Colors.black,
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
                  minExtendedWidth: 230,
                  elevation: 10,
                  trailing: Column(
                    children: [
                      IconButton(
                        icon: const Icon(
                          CupertinoIcons.arrow_down_right_arrow_up_left,
                        ),
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                      ),
                    ],
                  ),
                  extended: isExpanded,
                  leading: const Column(
                    children: [
                      FlutterLogo(),
                    ],
                  ),
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
                      padding: EdgeInsets.only(top: 40, bottom: 0),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        CupertinoIcons.square_grid_2x2,
                      ),
                      selectedIcon: Icon(
                        CupertinoIcons.square_grid_2x2_fill,
                      ),
                      label: Text("Sales"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        CupertinoIcons.chart_pie,
                      ),
                      selectedIcon: Icon(
                        CupertinoIcons.chart_pie_fill,
                      ),
                      label: Text("Reports"),
                      padding: EdgeInsets.only(top: 0, bottom: 100),
                    ),
                    NavigationRailDestination(
                      icon: Icon(CupertinoIcons.person_circle),
                      selectedIcon: Icon(CupertinoIcons.person_circle_fill),
                      label: Text("Profile Screen"),
                    ),
                    NavigationRailDestination(
                        icon: Icon(
                          CupertinoIcons.chart_pie,
                        ),
                        selectedIcon: Icon(
                          CupertinoIcons.chart_pie_fill,
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
