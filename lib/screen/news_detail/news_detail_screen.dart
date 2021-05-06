import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:loka_apps/model/news/news_model.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetailScreen extends StatefulWidget {
  final Datas data;

  const NewsDetailScreen({this.data});
  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  String date = '';

  @override
  void initState() {
    setState(() {
      DateTime tempDate =
          DateFormat('yyyy-MM-dd').parse(widget.data.created_at);
      date = tanggal(tempDate);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdee4eb),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'News',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.data.image, fit: BoxFit.cover),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                date,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                widget.data.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Theme(
              data: ThemeData(primaryColor: Colors.black),
              child: Html(
                  data: '''
                                        ${widget.data.content}
                                        ''',
                  onLinkTap: (String url) async {
                    // if (await canLaunch(url)) {
                    //   await launch(url);
                    // } else {
                    //   throw 'Could not launch $url';
                    // }
                  }),
            ),
          ),
        ],
      )),
    );
  }
}
