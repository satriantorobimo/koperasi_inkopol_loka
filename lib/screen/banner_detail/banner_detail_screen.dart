import 'package:flutter/material.dart';

import 'web_view_widget.dart';

class BannerDetailScreen extends StatefulWidget {
  final String url;

  const BannerDetailScreen(this.url);

  @override
  _BannerDetailScreenState createState() => _BannerDetailScreenState();
}

class _BannerDetailScreenState extends State<BannerDetailScreen> {
  Future<String> get _url async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return widget.url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Center(
          child: FutureBuilder<String>(
              future: _url,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) =>
                  snapshot.hasData
                      ? WebviewWidget(
                          url: snapshot.data,
                        )
                      : Container()),
        ));
  }
}
