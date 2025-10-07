import 'package:flutter/material.dart';
import '../../app_state.dart';
import '../screens/LoginPage.dart';

/// Register page
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _form = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_form.currentState!.validate()) return;
    final app = AppState.of(context);
    final err = app.registerUser(
      username: _username.text,
      email: _email.text,
      password: _password.text,
    );
    if (err != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Registration successful")));
    // After successful register, go to Login and prefill email
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder:
            (_) => LoginPage(
              prefilledEmail: _email.text,
              prefilledName: _username.text,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                controller: _username,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
                validator:
                    (v) =>
                        (v == null || v.trim().isEmpty)
                            ? "Enter username"
                            : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator:
                    (v) =>
                        (v == null || v.trim().isEmpty) ? "Enter email" : null,
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
                        (v == null || v.length < 4)
                            ? "Password must be at least 4 characters"
                            : null,
              ),
              const SizedBox(height: 16),
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
                    "Create Account",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
