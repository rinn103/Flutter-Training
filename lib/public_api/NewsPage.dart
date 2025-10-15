import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  bool _loading = true;
  List _articles = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    const apiKey = 'c0652d76d56d43ada90a841804f0a430'; // replace with your key
    final url =
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _articles = data['articles'];
        _loading = false;
      });
    } else {
      setState(() {
        _articles = [];
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tech News'),
        backgroundColor: Colors.orange,
      ),
      body:
          _loading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: _articles.length,
                itemBuilder: (context, index) {
                  final news = _articles[index];
                  return ListTile(
                    leading:
                        news['urlToImage'] != null
                            ? Image.network(news['urlToImage'], width: 60)
                            : const Icon(Icons.article),
                    title: Text(news['title'] ?? 'No title'),
                    subtitle: Text(news['source']?['name'] ?? 'Unknown'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder:
                            (_) => AlertDialog(
                              title: Text(news['title'] ?? ''),
                              content: Text(
                                news['description'] ?? 'No description',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                      );
                    },
                  );
                },
              ),
    );
  }
}
