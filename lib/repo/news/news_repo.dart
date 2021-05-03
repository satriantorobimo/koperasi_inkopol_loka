import 'dart:async';

import 'package:loka_apps/api/news/news_api.dart';
import 'package:loka_apps/model/news/news_model.dart';

class NewsRepository {
  NewsApiClient newsApiClient = NewsApiClient();

  Future<NewsModel> getNews() => newsApiClient.getNews();
}
