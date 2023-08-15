import 'package:flutter/material.dart';
import 'package:pharmacy_pos/views/home_page.dart';
import 'package:window_manager/window_manager.dart';

enum AppTheme {
  light,
  dark,
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      size: Size(1000, 700),
      minimumSize: Size(900, 500),
      center: false,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      alwaysOnTop: true,
      windowButtonVisibility: true,
      title: "Restaurant UI");
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTheme _currentTheme = AppTheme.light;

  void _toggleTheme() {
    setState(() {
      _currentTheme =
          _currentTheme == AppTheme.light ? AppTheme.dark : AppTheme.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant UI',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        cardColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey.shade100,
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}
