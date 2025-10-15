import 'package:flutter/material.dart';

class MyCenterTextApp extends StatelessWidget {
  const MyCenterTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrossAxis Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('CrossAxis Alignment')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.center, // try start, center, end
            children: [
              Container(
                width: 150,
                height: 80,
                color: Colors.teal,
                child: const Center(child: Text('Box 1')),
              ),
              const SizedBox(height: 20), // space between containers
              Container(
                width: 150,
                height: 80,
                color: Colors.orange,
                child: const Center(child: Text('Box 2')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
