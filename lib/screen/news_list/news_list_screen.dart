import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loka_apps/bloc/news/bloc.dart';
import 'package:loka_apps/model/news/news_model.dart';
import 'package:loka_apps/repo/news/news_repo.dart';
import 'package:indonesia/indonesia.dart';
import 'package:loka_apps/screen/news_detail/news_detail_screen.dart';
import 'package:loka_apps/util/custom_loader.dart';

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  NewsBloc newsBloc = NewsBloc(newsRepository: NewsRepository());
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  void initState() {
    newsBloc.add(GetNews());
    super.initState();
  }

  @override
  void dispose() {
    newsBloc.close();
    super.dispose();
  }

  Future<void> _getData() async {
    setState(() {
      newsBloc.add(GetNews());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdee4eb),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          'News',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
          ),
        ),
      ),
      body: BlocListener<NewsBloc, NewsState>(
          cubit: newsBloc,
          listener: (_, NewsState state) {
            if (state is NewsLoading) {
              LoaderDialogs.showLoadingDialog(context, _keyLoader);
            }
            if (state is NewsLoaded) {
              Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                  .pop();
            }
            if (state is NewsError) {
              Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                  .pop();
            }
          },
          child: BlocBuilder<NewsBloc, NewsState>(
              cubit: newsBloc,
              builder: (_, NewsState state) {
                if (state is NewsInitial) {
                  return Container();
                }
                if (state is NewsLoading) {
                  return Container();
                }
                if (state is NewsLoaded) {
                  return _newsList(state.newsModel);
                }
                if (state is NewsError) {
                  return Container();
                }
                return Container();
              })),
    );
  }

  Widget _newsList(NewsModel newsModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RefreshIndicator(
        onRefresh: _getData,
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 16);
            },
            shrinkWrap: true,
            itemCount: newsModel.data.data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            NewsDetailScreen(data: newsModel.data.data[index])),
                  );
                },
                child: _cardNews(newsModel.data.data[index]),
              );
            }),
      ),
    );
  }

  Widget _cardNews(Datas datas) {
    DateTime tempDate = DateFormat('yyyy-MM-dd').parse(datas.created_at);
    String date = tanggal(tempDate);
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width - 40,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(3, 3),
            )
          ]),
      child: Row(
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(datas.image),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    datas.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
