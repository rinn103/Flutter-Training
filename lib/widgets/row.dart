import 'package:flutter/material.dart';

class MyRowApp extends StatelessWidget {
  const MyRowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrossAxis Demo (Row)',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Row CrossAxis Alignment')),
        body: Center(
          child: SizedBox(
            height: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              // try start, center, end, stretch,
              children: [
                Container(width: 150, height: 80, color: Colors.teal),
                const SizedBox(width: 20), // space between containers
                Container(width: 150, height: 100, color: Colors.orange),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
