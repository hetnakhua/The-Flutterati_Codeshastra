import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class GrowWebView extends StatefulWidget {
  const GrowWebView({Key? key}) : super(key: key);

  @override
  State<GrowWebView> createState() => _GrowWebViewState();
}

class _GrowWebViewState extends State<GrowWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://groww.in/",
      )
    );
  }
}
