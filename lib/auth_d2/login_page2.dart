import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page2.dart';
import 'register_page2.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage2 extends StatefulWidget {
  final String? prefilledEmail;
  final String? prefilledName;

  const LoginPage2({super.key, this.prefilledEmail, this.prefilledName});

  @override
  State<LoginPage2> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage2> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _email.text = widget.prefilledEmail ?? '';
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) return;

    final name = widget.prefilledName ?? 'User';

    // ScaffoldMessenger.of(
    //   context,
    // ).showSnackBar(const SnackBar(content: Text("Login successful")));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage2(username: name, email: _email.text.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: SingleChildScrollView(
        //  allow scroll on small screens
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset(
              'lib/assets/fgv_logo.png',
              height: 180,
              fit: BoxFit.contain,
            ),
            //  SvgPicture.asset(
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
            // Lottie.asset(
            //   'lib/assets/lottie/test.json',
            //   width: 200,
            //   height: 200,
            //   repeat: false,
            // ),
            const SizedBox(height: 20),

            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator:
                        (v) =>
                            (v == null || v.trim().isEmpty)
                                ? "Enter email"
                                : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator:
                        (v) =>
                            (v == null || v.isEmpty) ? "Enter password" : null,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFED6C02), // FGV orange
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 2,
                      ),
                      onPressed: _submit,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterPage2(),
                        ),
                      );
                    },
                    child: Text("No account? Register"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
