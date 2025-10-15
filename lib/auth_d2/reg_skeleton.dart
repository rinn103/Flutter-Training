import 'package:flutter/material.dart';
import 'login_page2.dart';

class Reg_skeleton extends StatefulWidget {
  const Reg_skeleton({super.key});
  @override
  State<Reg_skeleton> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<Reg_skeleton> {
  final _form = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _hidePass = true;

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    // 1) validate
    // 2) show SnackBar
    // 3) pushReplacement to LoginPage2 with prefilledEmail and prefilledName
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: [
              // TODO: Username TextFormField with validator
              // TODO: Email TextFormField with validator
              // TODO: Password TextFormField with obscureText and validator
              // TODO: Create Account button calls _submit()
              // TODO: TextButton to go to Login
            ],
          ),
        ),
      ),
    );
  }
}
