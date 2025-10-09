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

  static const String _apiKey =
      'c0652d76d56d43ada90a841804f0a430'; // <-- Replace this
  static const String _base = 'https://newsapi.org/v2/top-headlines';

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    final uri = Uri.parse(
      '$_base?country=us&category=technology&apiKey=$_apiKey',
    );

    try {
      final resp = await http.get(uri).timeout(const Duration(seconds: 15));

      if (resp.statusCode == 200) {
        final decoded = json.decode(resp.body);
        final List data = decoded['articles'] ?? [];
        setState(() {
          _articles = data;
          _loading = false;
        });
      } else {
        setState(() {
          _error =
              'HTTP ${resp.statusCode}: ${resp.reasonPhrase}\n${resp.body}';
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Tech News',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
        ),
        backgroundColor: const Color(0xFFED6C02),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _fetchNews,
            icon: const Icon(Icons.refresh),
            color: Colors.white,
          ),
        ],
      ),
      body:
          _loading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
              ? Center(child: Text(_error!))
              : ListView.builder(
                itemCount: _articles.length,
                itemBuilder: (context, index) {
                  final article = _articles[index];
                  final image = article['urlToImage'];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading:
                          image != null
                              ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  image,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, _, __) =>
                                          const Icon(Icons.image_not_supported),
                                ),
                              )
                              : const Icon(Icons.article, size: 40),
                      title: Text(
                        article['title'] ?? 'No title',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(article['source']['name'] ?? ''),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder:
                              (_) => AlertDialog(
                                title: Text(article['title'] ?? ''),
                                content: Text(
                                  article['description'] ?? 'No description',
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('Close'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                        );
                      },
                    ),
                  );
                },
              ),
    );
  }
}
