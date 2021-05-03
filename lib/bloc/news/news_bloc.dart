import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:loka_apps/model/news/news_model.dart';
import 'package:loka_apps/repo/news/news_repo.dart';
import 'bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({@required this.newsRepository})
      : assert(newsRepository != null),
        super(NewsInitial());

  NewsRepository newsRepository;
  NewsModel newsModel;

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is GetNews) {
      yield NewsLoading();
      try {
        newsModel = await newsRepository.getNews();
        if (newsModel.code == '200') {
          yield NewsLoaded(newsModel: newsModel);
        } else {
          yield NewsError(error: 'no-data');
        }
      } catch (e) {
        yield NewsError(error: 'error');
      }
    }
  }
}
