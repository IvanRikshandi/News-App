import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:news_app/data/models/news_model.dart';

class HomePageViewModel {
  List<NewsItem> newsItem = [];

  Future<void> fetchNews() async {
    //load json
    final String jsonData =
        await rootBundle.loadString('assets/data/articles.json');
    final List<dynamic> jsonDataList = json.decode(jsonData);

    //parse
    newsItem = jsonDataList.map((item) => NewsItem.fromJson(item)).toList();
  }
}
