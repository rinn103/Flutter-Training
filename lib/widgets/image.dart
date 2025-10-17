import 'package:flutter/material.dart';

class MyImageApp extends StatelessWidget {
  const MyImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Image Example')),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // Image from assets
                const Text('Asset Image'),
                Image.asset('lib/assets/fgv_logo.png', width: 150),

                const SizedBox(height: 30),

                // Image from the internet
                const Text('Network Image'),
                Image.network(
                  'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_16x9.jpg?w=1200',
                  width: 150,
                  // loadingBuilder: (context, child, loadingProgress) {
                  //   if (loadingProgress == null) return child;
                  //   return const CircularProgressIndicator();
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
