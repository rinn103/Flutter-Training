// loading_screen.dart
import 'package:flutter/material.dart';
import 'login_page2.dart';
import 'package:lottie/lottie.dart';

class LoadingPage2 extends StatefulWidget {
  const LoadingPage2({super.key});

  @override
  State<LoadingPage2> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingPage2> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
        // child: Lottie.asset(
        //   'lib/assets/lottie/test.json',
        //   width: 140,
        //   repeat: true,
        //   animate: true,
        // ),
      ),
    );
  }
}
