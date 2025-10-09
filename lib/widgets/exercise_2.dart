import 'package:flutter/material.dart';

void main() {
  runApp(const MyInfoApp());
}

class MyInfoApp extends StatelessWidget {
  const MyInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Information List',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Contacts")),
        body: Container(
          padding: const EdgeInsets.all(16), // padding around the Column
          child: Column(
            children: const [
              ListTile(
                leading: Icon(Icons.phone, color: Colors.black),
                title: Text("FGV"),
                subtitle: Text("+603 7965 7979"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.web, color: Colors.black),
                title: Text("Website"),
                subtitle: Text("www.fgvholdings.com"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_city, color: Colors.black),
                title: Text("Location"),
                subtitle: Text("Kuala Lumpur, Malaysia"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
