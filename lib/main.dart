import 'package:flutter/material.dart';
import 'app_state.dart';
import 'auth/LoginPage.dart';
import 'auth/loading_screen.dart';

import 'widgets/center_text.dart';
import 'widgets/column.dart';
import 'widgets/container.dart';
import 'widgets/icon.dart';
import 'widgets/exercise_2.dart';
import 'widgets/listTile.dart';
import 'widgets/exercise_1.dart';
import 'widgets/stack.dart';
import 'widgets/wrap.dart';

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
