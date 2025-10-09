import 'package:flutter/material.dart';

void main() {
  runApp(const MyWrapApp());
}

class MyWrapApp extends StatelessWidget {
  const MyWrapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Wrap Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Wrap Demo")),
        body: Center(
          child: Wrap(
            spacing: 10, // horizontal space
            runSpacing: 10, // vertical space
            children: [
              Container(width: 80, height: 80, color: Colors.red),
              Container(width: 80, height: 80, color: Colors.green),
              Container(width: 80, height: 80, color: Colors.blue),
              Container(width: 80, height: 80, color: Colors.orange),
              Container(width: 80, height: 80, color: Colors.purple),
              Container(width: 80, height: 80, color: Colors.teal),
            ],
          ),
        ),
      ),
    );
  }
}
