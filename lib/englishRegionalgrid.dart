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
              color: (drawer_list.pak_observer)?Colors.blue:Colors.grey,
              child: InkWell( //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.pak_observer=!(drawer_list.pak_observer);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/pak_observer.png", scale: 2, ), Text('Pakistan Observer', textAlign: TextAlign.center, )],
                  ))),
          Material(
              color: (drawer_list.pak_today)?Colors.blue:Colors.grey,
              child: InkWell( //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.pak_today=!(drawer_list.pak_today);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/pak_today.png", scale: 2, ), Text('Pakistan Today', textAlign: TextAlign.center, )],
                  ))),
          Material(
              color: (drawer_list.radio_pak)?Colors.blue:Colors.grey,
              child: InkWell( //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.radio_pak=!(drawer_list.radio_pak);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/radio_pak.png", scale: 2, ), Text('Radio Pakistan', textAlign: TextAlign.center, )],
                  ))),
          Material(
              color: (drawer_list.frontier_post)?Colors.blue:Colors.grey,
              child: InkWell( //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.frontier_post=!(drawer_list.frontier_post);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/frontier_post.png", scale: 2, ), Text('Frontier Post', textAlign: TextAlign.center, )],
                  ))),
          Material(
              color: (drawer_list.daily_pak)?Colors.blue:Colors.grey,
              child: InkWell( //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.daily_pak=!(drawer_list.daily_pak);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/daily_pak.png", scale: 2, ), Text('Daily Pakistan', textAlign: TextAlign.center, )],
                  ))),
        ],
      ),);
  }
}