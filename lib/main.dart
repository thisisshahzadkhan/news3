import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'trending.dart';
import 'archives.dart';
import 'search.dart';
import 'signup.dart';
import 'filter.dart';
import 'news_source_page.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final routes =<String, WidgetBuilder>{
    '/login':(context)=>mylogin(),
    '/signup':(context)=>signup(),
    '/trending': (context)=>(trending()),
    '/home': (context)=>(home()),
    '/archives': (context)=>(archives()),
    '/search': (context)=>(search()),
    '/filter': (context)=>(filter()),
    '/news_source_page':(context)=>(news_source_page())
  };
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'News Hunt',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        fontFamily: 'SF Pro',
        primarySwatch:Colors.blue,
      ),
      home: home(),
      routes: routes,
    );
  }
}
