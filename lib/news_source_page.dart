import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class news_source_page extends StatelessWidget{
  final String source;
  news_source_page({Key key,this.source}):super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: WebView(initialUrl: source,)),
    );
  }

}