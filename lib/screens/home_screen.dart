import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600
          ),
        ),
        elevation: 2,
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.green[300],
      ),
      backgroundColor: Colors.white,
    );
  }
}
