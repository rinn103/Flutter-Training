import 'package:flutter/material.dart';

void main() {
  runApp(const MyColumnApp());
}

class MyColumnApp extends StatelessWidget {
  const MyColumnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // center vertically
            children: [
              Container(width: 150, height: 80, color: Colors.teal),
              const SizedBox(height: 20), // space between containers
              Container(width: 150, height: 80, color: Colors.orange),
            ],
          ),
        ),
      ),
    );
  }
}
