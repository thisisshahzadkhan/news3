import 'package:flutter/material.dart';
import 'filter_list.dart';
class englishInternationalgrid extends StatefulWidget{
    englishInternationalgrid_state createState()=>englishInternationalgrid_state();
}
class englishInternationalgrid_state extends  State<englishInternationalgrid>{

  Widget build(BuildContext context){
    return Scaffold(
        body: GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          shrinkWrap: true,
        children:<Widget>[
      Material(
      color: (drawer_list.dawn)?Colors.blue:Colors.grey,
      child: InkWell(  //value: drawer_list.dawn,
      onTap: (){setState(() {drawer_list.dawn=!(drawer_list.dawn);});},
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Image.asset("assets/dawn.png", scale: 2, ), Text('Dawn News\n', textAlign: TextAlign.center, )],
      ))),
      Material(
      color: (drawer_list.times_of_india)?Colors.blue:Colors.grey,
      child: InkWell(//value: drawer_list.dawn,
      onTap: (){setState(() {drawer_list.times_of_india=!(drawer_list.times_of_india);});},
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Image.asset("assets/times_of_india.png",scale: 2,),Text('The Times of India',textAlign: TextAlign.center,)],
      ))),
      Material(
          color: (drawer_list.daily_times)?Colors.blue:Colors.grey,
          child: InkWell( //value: drawer_list.dawn,
              onTap: (){setState(() {drawer_list.daily_times=!(drawer_list.daily_times);});},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/daily_times.png", scale: 2, ), Text('Daily Times\n', textAlign: TextAlign.center, )],
              ))),
      Material(
          color: (drawer_list.business_recorder)?Colors.blue:Colors.grey,
          child: InkWell( //value: drawer_list.dawn,
              onTap: (){setState(() {drawer_list.business_recorder=!(drawer_list.business_recorder);});},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/business_recorder.png", scale: 2, ), Text('Business Recoreder', textAlign: TextAlign.center, )],
              ))),
      Material(
          color: (drawer_list.the_nation)?Colors.blue:Colors.grey,
          child: InkWell( //value: drawer_list.dawn,
              onTap: (){setState(() {drawer_list.the_nation=!(drawer_list.the_nation);});},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/the_nation.png", scale: 2, ), Text('The Nation\n', textAlign: TextAlign.center, )],
              ))),
      Material(
          color: (drawer_list.the_news)?Colors.blue:Colors.grey,
          child: InkWell( //value: drawer_list.dawn,
              onTap: (){setState(() {drawer_list.the_news=!(drawer_list.the_news);});},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/the_news.png", scale: 2, ), Text('The News\n', textAlign: TextAlign.center, )],
              ))),
      Material(
          color: (drawer_list.the_news_tribe)?Colors.blue:Colors.grey,
          child: InkWell( //value: drawer_list.dawn,
              onTap: (){setState(() {drawer_list.the_news_tribe=!(drawer_list.the_news_tribe);});},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/the_news_tribe.png", scale: 2, ), Text('The News Tribe', textAlign: TextAlign.center, )],
              ))),
      Material(
          color: (drawer_list.express_tribune)?Colors.blue:Colors.grey,
          child: InkWell( //value: drawer_list.dawn,
              onTap: (){setState(() {drawer_list.express_tribune=!(drawer_list.express_tribune);});},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/express_tribune.png", scale: 2, ), Text('Express Tribune', textAlign: TextAlign.center, )],
              ))),
],
      ),);
  }
}