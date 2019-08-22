import 'package:flutter/material.dart';
import 'englishInternationalgrid.dart';
import 'urdunewsgrid.dart';
import 'englishRegionalgrid.dart';
class filter extends StatefulWidget{
    filter_state createState()=>filter_state();
}
class filter_state extends State<filter>{
  bool english=true;
  bool international=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Filters',style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,centerTitle: true,),
      body: Container(
        decoration: BoxDecoration(color: Color(0xfff7f7f7)),
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 15,),
              Text("Filters",textScaleFactor: 3,textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),),
              SizedBox(height: 15,),
              Card(
                color: Color.fromRGBO(255, 255, 255, .6),
           //     color: Colors.blue[50],
                child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 20),
                    child: Column(children: <Widget>[
                      Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text("Languages",textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold),)],),
                      SizedBox(height: 5,),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ///////english
                          InkWell(onTap: (){english=true; setState((){});},
                            child: Chip(backgroundColor: Colors.blue[(english)?100:0],label: Text("English",style: TextStyle(color: (english)?Colors.blue:Colors.black, fontWeight:(english)?FontWeight.bold:FontWeight.normal,fontFamily: 'Montserrat'),)),),
                          SizedBox(width: 10,),
                          //////////urdu
                          InkWell(onTap: (){english=false; setState((){});},
                            child: Chip(backgroundColor: Colors.blue[(!english)?100:0],label: Text("Urdu",style: TextStyle(color: (!english)?Colors.blue:Colors.black, fontWeight:(!english)?FontWeight.bold:FontWeight.normal,fontFamily: 'Montserrat'),)),),
                        ],),
                    ],),
                  ),
              ),

            ////////////////////////////////////  //News Type
              Visibility(visible: (english)?true:false,
                child: Card(color: Color.fromRGBO(255, 255, 255, .6),
                  child: Padding(padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 20),
                    child: Column(
                      children: <Widget>[
                          Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text("News Type",textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),)],),
                          SizedBox(height: 5,),
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ///////International
                              InkWell(onTap: (){international=true; setState((){});},
                                child: Chip(backgroundColor: Colors.blue[(international)?100:0],label: Text("International",style: TextStyle(color: (international)?Colors.blue:Colors.black, fontWeight:(international)?FontWeight.bold:FontWeight.normal,fontFamily: 'Montserrat'),)),),
                              SizedBox(width: 10,),
                              //////////regional
                              InkWell(onTap: (){international=false; setState((){});},
                                child: Chip(backgroundColor: Colors.blue[(!international)?100:0],label: Text("Regional",style: TextStyle(color: (!international)?Colors.blue:Colors.black, fontWeight:(!international)?FontWeight.bold:FontWeight.normal,fontFamily: 'Montserrat'),)),),
                            ],),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height:5),
              /////////////////////////grid
              Expanded(child: (english)?(international)?englishInternationalgrid():englishRegionalgrid():urdunewsgrid()),
              //Expanded(child: englishnewsgrid()),
            ],
          ),
        ),
      ),
    );
  }

}