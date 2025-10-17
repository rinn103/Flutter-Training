import 'package:flutter/material.dart';

class MyListTileApp extends StatelessWidget {
  const MyListTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListTile Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("ListTile Demo")),
        body: ListView(
          children: const [
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text("John Doe"),
              subtitle: Text("Flutter Student"),
              trailing: Icon(Icons.phone, color: Colors.green),
            ),
            Divider(), // adds a line between items
            ListTile(
              leading: Icon(Icons.email, color: Colors.red),
              title: Text("Email"),
              subtitle: Text("flutter.training@email.com"),
              trailing: Icon(Icons.send, color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
