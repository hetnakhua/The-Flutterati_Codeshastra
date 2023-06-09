import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class TradeWebView extends StatefulWidget {
  const TradeWebView({Key? key}) : super(key: key);

  @override
  State<TradeWebView> createState() => _TradeWebViewState();
}

class _TradeWebViewState extends State<TradeWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stock Market', style: TextStyle(color: Colors.white),),
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: "https://www.tradingview.com/chart/",
        )
    );
  }
}
