import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app_state.dart';
import '../screens/LoginPage.dart';
import 'package:lottie/lottie.dart';

/// After login, show username
class HomePage extends StatelessWidget {
  final User user;
  const HomePage({super.key, required this.user});

  void _logout(BuildContext context) {
    final app = AppState.of(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
        ),
        backgroundColor: const Color(0xFFED6C02),
        elevation: 1,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black54),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset(
            //   'lib/assets/tree.svg',
            //   width: 140,
            //   semanticsLabel: 'tree',
            //   placeholderBuilder:
            //       (_) => const SizedBox(
            //         width: 24,
            //         height: 24,
            //         child: CircularProgressIndicator(),
            //       ),
            // ),
            Lottie.asset(
              'lib/assets/lottie/SquareBox.json',
              width: 200,
              height: 200,
              repeat: false,
            ),
            const SizedBox(height: 20),
            Text(
              "Welcome, ${user.username}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
