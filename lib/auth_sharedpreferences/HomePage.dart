import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth_sharedpreferences/LoginPage.dart';
import '../public_api/NewsPage.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// After login, show username
class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  Future<void> _logout(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final ok = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Delete account'),
            content: const Text(
              'This will remove all saved user data on this device. Continue?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Delete'),
              ),
            ],
          ),
    );
    if (ok != true) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Lottie.asset(
            //   'lib/assets/lottie/SquareBox.json',
            //   width: 200,
            //   height: 200,
            //   repeat: false,
            // ),
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
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // delete account
            SizedBox(
              width: double.infinity,
              // child: ElevatedButton.icon(
              //   onPressed: () => _confirmDelete(context),
              //   icon: const Icon(Icons.delete_forever),
              //   label: const Text('Delete account'),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.red,
              //     foregroundColor: Colors.white,
              //     padding: const EdgeInsets.symmetric(vertical: 14),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     elevation: 2,
              //   ),
              // ),
            ),
            // news public API
            const SizedBox(height: 20),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton.icon(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (_) => const NewsPage()),
            //       );
            //     },
            //      icon: const Icon(Icons.newspaper),
            //     label: const Text('View News'),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: const Color(0xFFED6C02),
            //       foregroundColor: Colors.white,
            //       padding: const EdgeInsets.symmetric(vertical: 14),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       elevation: 2,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
