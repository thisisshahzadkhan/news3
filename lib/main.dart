import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'trending.dart';
import 'archives.dart';
import 'search.dart';
import 'signup.dart';
import 'filter.dart';

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
  };
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch:Colors.blue,
      ),
      home: home(),
      routes: routes,
    );
  }
}

