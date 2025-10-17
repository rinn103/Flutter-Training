import 'package:flutter/material.dart';

import 'center_text.dart';
import 'column.dart';
import 'container.dart';
import 'icon.dart';
import 'exercise_2.dart';
import 'listTile.dart';
import 'exercise_1.dart';
import 'stack.dart';
import 'wrap.dart';
import 'image.dart';
import 'row.dart';

class MyWidgetApp extends StatelessWidget {
  const MyWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WidgetMenuPage(),
    );
  }
}

class WidgetMenuPage extends StatelessWidget {
  const WidgetMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Menu'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyContainerApp()),
                );
              },
              child: const Text('Go to container widget'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyRowApp()),
                );
              },
              child: const Text('Go to row widget'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyColumnApp()),
                );
              },
              child: const Text('Go to column widget'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyCenterTextApp()),
                );
              },
              child: const Text('Go to text widget'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyStackApp()),
                );
              },
              child: const Text('Go to stack widget'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyIconApp()),
                );
              },
              child: const Text('Go to icon widget'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyWrapApp()),
                );
              },
              child: const Text('Go to wrap widget'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyImageApp()),
                );
              },
              child: const Text('Go to image widget'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyListTileApp()),
                );
              },
              child: const Text('Go to list tile widget'),
            ),
          ],
        ),
      ),
    );
  }
}
