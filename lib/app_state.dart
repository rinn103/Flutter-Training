import 'package:flutter/material.dart';
import 'main.dart';

class User {
  final String username;
  final String email;
  final String password;
  User({required this.username, required this.email, required this.password});
}

class AppState extends StatefulWidget {
  const AppState({super.key});

  static _AppState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppState>()!;

  @override
  State<AppState> createState() => _AppState();
}

class _AppState extends State<AppState> {
  final Map<String, User> _usersByEmail = {}; // email -> User

  String? registerUser({
    required String username,
    required String email,
    required String password,
  }) {
    final e = email.trim().toLowerCase();
    if (_usersByEmail.containsKey(e)) return "Email already registered";
    _usersByEmail[e] = User(
      username: username.trim(),
      email: e,
      password: password,
    );
    return null;
  }

  User? login({required String email, required String password}) {
    final e = email.trim().toLowerCase();
    final u = _usersByEmail[e];
    if (u == null) return null;
    if (u.password != password) return null;
    return u;
  }

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
