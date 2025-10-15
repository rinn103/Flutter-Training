import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page2.dart';
import '../public_api/NewsPage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage2 extends StatelessWidget {
  final String username;
  final String? email; // pass this in so we can prefill on logout

  const HomePage2({super.key, required this.username, this.email});

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder:
            (_) => LoginPage2(prefilledEmail: email, prefilledName: username),
      ),
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
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // center vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // center horizontally
            children: [
              const SizedBox(height: 24),
              SvgPicture.asset(
                'lib/assets/tree.svg',
                width: 140,
                semanticsLabel: 'tree',
                placeholderBuilder:
                    (_) => const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(),
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                "Welcome, $username",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
