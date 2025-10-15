import 'package:flutter/material.dart';

class MyIconApp extends StatelessWidget {
  const MyIconApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Stack Demo")),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(width: 250, height: 250, color: Colors.teal),
              Container(width: 180, height: 180, color: Colors.orange),
              Container(width: 120, height: 120, color: Colors.purple),
              const Icon(Icons.star, color: Colors.white, size: 50),
            ],
          ),
        ),
      ),
    );
  }
}
