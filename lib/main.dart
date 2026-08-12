import 'package:flutter/material.dart';

import 'screens/home_screens.dart';
import 'screens/profile_screens.dart';
import 'screens/login_screens.dart';
import 'screens/register_screens.dart';
import 'screens/login_app.dart';
import 'screens/main_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App name
      title: 'My Flutter App',

      // Remove DEBUG banner
      debugShowCheckedModeBanner: false,

      // Light theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      // Dark theme
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      // Follow device theme
      themeMode: ThemeMode.system,

      // First screen
      // home: const HomePage(),

      initialRoute: '/home',
      // initialRoute: '/',

      routes: {
        '/main': (context) => const MainScreens(),
       '/home': (context) => const HomeScreens(),
        '/profile': (context) => const ProfileScreens(),
        '/login': (context) => const LoginScreens(),
        '/register': (context) => const Registerscreens(),
        '/loginapp': (context) => const LoginApp(),
      },
    );
  }
}