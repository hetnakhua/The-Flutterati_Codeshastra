import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class FdWebView extends StatefulWidget {
  const FdWebView({Key? key}) : super(key: key);

  @override
  State<FdWebView> createState() => _FdWebViewState();
}

class _FdWebViewState extends State<FdWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stock Market', style: TextStyle(color: Colors.white),),
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: "https://www.motilaloswalmf.com/tools/sip-return-calculator",
        )
    );
  }
}
