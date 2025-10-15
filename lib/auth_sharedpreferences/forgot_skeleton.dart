// forgot_password_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  // Step 1: Create form key and controllers
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _newPass = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    // Step 2: Dispose controllers
    _email.dispose();
    _newPass.dispose();
    _confirm.dispose();
    super.dispose();
  }

  // Step 3: Create async method to handle password reset
  Future<void> _reset() async {
    // TODO: Validate form first
    // TODO: Get SharedPreferences instance
    // TODO: Compare entered email with saved one
    // TODO: If not found, show SnackBar “Email not found on this device”
    // TODO: If found, save new password to SharedPreferences
    // TODO: Show SnackBar “Password updated. Please login.”
    // TODO: Navigate back to LoginPage (remove all previous routes)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: [
              // Step 4: Registered Email field
              // Step 5: New Password field
              // Step 6: Confirm Password field
              // Step 7: Update Password button
            ],
          ),
        ),
      ),
    );
  }
}
