import 'package:flutter/material.dart';

import 'auth_d2/home_page2.dart';
import 'auth_d2/login_page2.dart';
import 'auth_d2/register_page2.dart';
import 'auth_d2/loading_page2.dart';

import 'auth_sharedpreferences/LoginPage.dart';
import 'auth_sharedpreferences/loading_screen.dart';

import 'widgets/center_text.dart';
import 'widgets/column.dart';
import 'widgets/container.dart';
import 'widgets/icon.dart';
import 'widgets/exercise_2.dart';
import 'widgets/listTile.dart';
import 'widgets/exercise_1.dart';
import 'widgets/stack.dart';
import 'widgets/wrap.dart';
import 'widgets/image.dart';

import 'token_api/git.dart';
import 'public_api/NewsPage.dart';

import 'demo.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const MyImageApp(),
    );
  }
}
