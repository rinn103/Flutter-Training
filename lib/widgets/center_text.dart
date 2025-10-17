import 'package:flutter/material.dart';

class MyCenterTextApp extends StatelessWidget {
  const MyCenterTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrossAxis Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Text Demo')),
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
                child: const Center(
                  child: Text(
                    'Box 1',
                    // style: TextStyle(
                    //   fontSize: 20,
                    //   fontWeight: FontWeight.bold,
                    //   color: Colors.white,
                    //   letterSpacing: 3,
                    //   wordSpacing: 8,
                    //   shadows: [
                    //     Shadow(
                    //       color: Colors.black38,
                    //       blurRadius: 4,
                    //       offset: Offset(3, 3),
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
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
