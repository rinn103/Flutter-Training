import 'package:flutter/material.dart';
import 'package:svg/screens/svg.dart';
import 'app_state.dart';
import '../screens/LoginPage.dart';
import '../screens/loading_screen.dart';

void main() => runApp(const AppState());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const LoadingScreen(),
    );
  }
}
