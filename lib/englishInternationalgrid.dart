import 'package:flutter/material.dart';
import 'filter_list.dart';
class englishInternationalgrid extends StatefulWidget{
    englishInternationalgrid_state createState()=>englishInternationalgrid_state();
}
class englishInternationalgrid_state extends  State<englishInternationalgrid>{

  Widget build(BuildContext context){
    //print(filter_list.newsnames.length);
    return Scaffold(
        body: GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          shrinkWrap: true,
        children:<Widget>[
      Material(
      color: (filter_list.newsnames.contains('dawn'))?Colors.blue:Colors.grey,
      child: InkWell(  //value: drawer_list.dawn,
      onTap: (){setState(() {filter_list.newsnames.contains('dawn')?filter_list.newsnames.remove('dawn'):filter_list.newsnames.add('dawn');});},
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Image.asset("assets/dawn.png", scale: 2, ), Text('Dawn News\n', textAlign: TextAlign.center, )],
      ))),
      Material(
      color: (filter_list.newsnames.contains('times_of_india'))?Colors.blue:Colors.grey,
      child: InkWell(//value: drawer_list.dawn,
      onTap: (){setState(() {filter_list.newsnames.contains('times_of_india')?filter_list.newsnames.remove('times_of_india'):filter_list.newsnames.add('times_of_india');});},
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Image.asset("assets/times_of_india.png",scale: 2,),Text('The Times of India',textAlign: TextAlign.center,)],
      ))),
      Material(
          color: (filter_list.newsnames.contains('daily_times'))?Colors.blue:Colors.grey,
          child: InkWell( //value: drawer_list.dawn,
              onTap: (){setState(() {filter_list.newsnames.contains('daily_times')?filter_list.newsnames.remove('daily_times'):filter_list.newsnames.add('daily_times');});},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/daily_times.png", scale: 2, ), Text('Daily Times\n', textAlign: TextAlign.center, )],
              ))),
      Material(
          color: (filter_list.newsnames.contains('business_recorder'))?Colors.blue:Colors.grey,
          child: InkWell( //value: drawer_list.dawn,
              onTap: (){setState(() {filter_list.newsnames.contains('business_recorder')?filter_list.newsnames.remove('business_recorder'):filter_list.newsnames.add('business_recorder');});},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/business_recorder.png", scale: 2, ), Text('Business Recoreder', textAlign: TextAlign.center, )],
              ))),
      Material(
          color: (filter_list.newsnames.contains('the_nation'))?Colors.blue:Colors.grey,
          child: InkWell( //value: drawer_list.dawn,
              onTap: (){setState(() {filter_list.newsnames.contains('the_nation')?filter_list.newsnames.remove('the_nation'):filter_list.newsnames.add('the_nation');});},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/the_nation.png", scale: 2, ), Text('The Nation\n', textAlign: TextAlign.center, )],
              ))),
      Material(
          color: (filter_list.newsnames.contains('the_news'))?Colors.blue:Colors.grey,
          child: InkWell( //value: drawer_list.dawn,
              onTap: (){setState(() {filter_list.newsnames.contains('the_news')?filter_list.newsnames.remove('the_news'):filter_list.newsnames.add('the_news');});},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/the_news.png", scale: 2, ), Text('The News\n', textAlign: TextAlign.center, )],
              ))),
      Material(
          color: (filter_list.newsnames.contains('the_news_tribe'))?Colors.blue:Colors.grey,
          child: InkWell( //value: drawer_list.dawn,
              onTap: (){setState(() {filter_list.newsnames.contains('the_news_tribe')?filter_list.newsnames.remove('the_news_tribe'):filter_list.newsnames.add('the_news_tribe');});},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/the_news_tribe.png", scale: 2, ), Text('The News Tribe', textAlign: TextAlign.center, )],
              ))),
      Material(
          color: (filter_list.newsnames.contains('express_tribune'))?Colors.blue:Colors.grey,
          child: InkWell( //value: drawer_list.dawn,
              onTap: (){setState(() {filter_list.newsnames.contains('express_tribune')?filter_list.newsnames.remove('express_tribune'):filter_list.newsnames.add('express_tribune');});},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/express_tribune.png", scale: 2, ), Text('Express Tribune', textAlign: TextAlign.center, )],
              ))),
],
      ),);
  }
}