import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the SVG package

class SVG extends StatelessWidget {
  const SVG({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SVG Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter SVG Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'SVG from the Internet',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SvgPicture.network(
                'https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/android.svg',
                width: 150,
                height: 150,
                placeholderBuilder:
                    (context) =>
                        const CircularProgressIndicator(), // shows while loading
              ),
              const SizedBox(height: 40),
              const Text(
                'SVG from Local Asset',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SvgPicture.asset('lib/assets/flutter_logo.svg', width: 120),
            ],
          ),
        ),
      ),
    );
  }
}
