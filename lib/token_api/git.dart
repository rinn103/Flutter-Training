import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyGitApp extends StatelessWidget {
  const MyGitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub API Token Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GitHubRepoPage(),
    );
  }
}

class GitHubRepoPage extends StatefulWidget {
  const GitHubRepoPage({super.key});

  @override
  State<GitHubRepoPage> createState() => _GitHubRepoPageState();
}

class _GitHubRepoPageState extends State<GitHubRepoPage> {
  // final String token =
  //     'token ur token';
  List<dynamic> repos = [];
  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchRepos();
  }

  Future<void> fetchRepos() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.github.com/user/repos'),
        headers: {
          'Authorization': 'token ghp_urtoken',
          'Accept': 'application/vnd.github+json',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          repos = json.decode(response.body);
          loading = false;
        });
      } else {
        setState(() {
          error = 'Error ${response.statusCode}: ${response.reasonPhrase}';
          loading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My GitHub Repos')),
      body:
          loading
              ? const Center(child: CircularProgressIndicator())
              : error != null
              ? Center(child: Text(error!))
              : ListView.builder(
                itemCount: repos.length,
                itemBuilder: (context, index) {
                  final repo = repos[index];
                  return ListTile(
                    leading: const Icon(Icons.folder),
                    title: Text(repo['name']),
                    subtitle: Text(
                      repo['private'] ? 'Private Repo' : 'Public Repo',
                    ),
                    trailing: Text('${repo['stargazers_count']} ⭐'),
                  );
                },
              ),
    );
  }
}
