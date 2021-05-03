import 'package:loka_apps/function/network_util.dart';
import 'package:loka_apps/model/news/news_model.dart';
import 'package:loka_apps/util/url_string.dart';

class NewsApiClient {
  NewsModel newsModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<NewsModel> getNews() async {
    final Map<String, String> header = urlString.getHeaderType();

    return await netUtil
        .get(urlString.getUrlNews(), headers: header)
        .then((dynamic res) {
      print(res);
      newsModel = NewsModel.fromJson(res);
      return newsModel;
    });
  }
}
