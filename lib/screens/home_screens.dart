import 'package:flutter/material.dart';

class Homescreens extends StatelessWidget {
  const Homescreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screens'),
      ),
      body: const Center(
        child: Text('Welcome to the Home screens!'),
      ),
    );
  }
}