import 'package:flutter/material.dart';
import 'filter_list.dart';
class englishRegionalgrid extends StatefulWidget{
  englishRegionalgrid_state createState()=>englishRegionalgrid_state();
}
class englishRegionalgrid_state extends  State<englishRegionalgrid>{

  Widget build(BuildContext context){
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        //padding: EdgeInsets.all(5),
        shrinkWrap: true,
        children:<Widget>[
          Material(
              //borderRadius: BorderRadius.circular(10.0),
              color: (filter_list.newsnames.contains('pak_observer'))?Colors.blue:Colors.grey,
              child: InkWell( //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('pak_observer')?filter_list.newsnames.remove('pak_observer'):filter_list.newsnames.add('pak_observer');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/pak_observer.png", scale: 2, ), Text('Pakistan Observer', textAlign: TextAlign.center, )],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('pak_today'))?Colors.blue:Colors.grey,
              child: InkWell( //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('pak_today')?filter_list.newsnames.remove('pak_today'):filter_list.newsnames.add('pak_today');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/pak_today.png", scale: 2, ), Text('Pakistan Today', textAlign: TextAlign.center, )],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('radio_pak'))?Colors.blue:Colors.grey,
              child: InkWell( //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('radio_pak')?filter_list.newsnames.remove('radio_pak'):filter_list.newsnames.add('radio_pak');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/radio_pak.png", scale: 2, ), Text('Radio Pakistan', textAlign: TextAlign.center, )],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('frontier_post'))?Colors.blue:Colors.grey,
              child: InkWell( //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('frontier_post')?filter_list.newsnames.remove('frontier_post'):filter_list.newsnames.add('frontier_post');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/frontier_post.png", scale: 2, ), Text('Frontier Post', textAlign: TextAlign.center, )],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('daily_pak'))?Colors.blue:Colors.grey,
              child: InkWell( //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('daily_pak')?filter_list.newsnames.remove('daily_pak'):filter_list.newsnames.add('daily_pak');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/daily_pak.png", scale: 2, ), Text('Daily Pakistan', textAlign: TextAlign.center, )],
                  ))),
        ],
      ),);
  }
}