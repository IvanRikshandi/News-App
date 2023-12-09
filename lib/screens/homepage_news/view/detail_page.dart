import 'package:flutter/material.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/screens/article_webview/article_webview.dart';

class DetailPageNews extends StatelessWidget {
  final NewsItem newsItem;

  const DetailPageNews({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          newsItem.title,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(newsItem.urlToImage),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(newsItem.description),
                  const Divider(color: Colors.grey),
                  Text(
                    newsItem.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Text('Date: ${newsItem.publishedAt}'),
                  const SizedBox(height: 10),
                  Text('Author: ${newsItem.author}'),
                  const Divider(color: Colors.grey),
                  Text(
                    newsItem.content,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ArticleWebView(url: newsItem.url),
                          ));
                    },
                    child: const Text('Read More'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
