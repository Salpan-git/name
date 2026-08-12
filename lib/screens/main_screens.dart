import 'package:flutter/material.dart';
import 'package:name/screens/home_screens.dart';
import 'package:name/screens/login_screens.dart';
import 'package:name/screens/profile_screens.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const Center(child: Text("HomeScreens")),
    const Center(child: Text("ProfileScreens")),
    const Center(child: Text("LoginScreens")),
  ];

  final List<Widget> pages = [HomeScreens(),ProfileScreens(),LoginScreens()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.login_rounded), label: 'Login'),
        ],
      ),
    );
  }
}
