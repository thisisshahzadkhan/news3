import 'package:flutter/material.dart';

class search extends StatefulWidget{
  search_state createState()=> search_state();
}

class search_state extends State<search>{
    @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 3000),
        curve: Curves.bounceInOut,
        child:Scaffold(
    appBar: AppBar(
      title: Text("Search News",style: TextStyle(color: Colors.black),),
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    body: CustomScrollView(
      slivers: <Widget>[
      SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: TextFormField(
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
            onPressed:(){
            setState(() {
              
            });
            },
            color: Colors.black,
          ),
        ],

      ),
      ],
    ),
    ));
    
  }
}