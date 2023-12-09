import 'package:flutter/material.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/screens/homepage_news/view/detail_page.dart';
import 'package:news_app/screens/homepage_news/view_model/hompage_viewmodel.dart';

class HomePageNews extends StatefulWidget {
  const HomePageNews({super.key});

  @override
  State<HomePageNews> createState() => _HomePageNewsState();
}

class _HomePageNewsState extends State<HomePageNews> {
  final HomePageViewModel _viewModel = HomePageViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: FutureBuilder(
        future: _viewModel.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
                itemCount: _viewModel.newsItem.length,
                itemBuilder: (context, idx) {
                  final newsItem = _viewModel.newsItem[idx];
                  return _buildNewsList(newsItem);
                });
          }
        },
      ),
    );
  }

  ListTile _buildNewsList(NewsItem newsItem) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Image.network(
        newsItem.urlToImage,
        width: 100,
        errorBuilder: (ctx, err, _) => const Icon(Icons.error),
      ),
      title: Text(newsItem.title),
      subtitle: Text(newsItem.author),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPageNews(newsItem: newsItem),
          ),
        );
      },
    );
  }
}
