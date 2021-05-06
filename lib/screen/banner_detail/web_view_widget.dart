import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loka_apps/util/custom_loader.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewWidget extends StatefulWidget {
  const WebviewWidget({this.url});
  final String url;

  @override
  _WebviewWidgetState createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {
  WebView _webView;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.

    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }

    _webView = WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      onPageFinished: _handleLoad,
      onPageStarted: _startLoad,
    );
  }

  void _startLoad(String value) {
    LoaderDialogs.showLoadingDialog(context, _keyLoader);
  }

  void _handleLoad(String value) {
    // setState(() {
    //   _stackToView = 0;
    // });
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _webView = null;
  }

  @override
  Widget build(BuildContext context) {
    return _webView;
  }
}
