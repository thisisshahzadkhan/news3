import 'package:flutter/material.dart';
import 'filter_list.dart';
class urdunewsgrid extends StatefulWidget{
  urdunewsgrid_state createState()=>urdunewsgrid_state();
}
class urdunewsgrid_state extends  State<urdunewsgrid>{
  Widget build(BuildContext context){
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        shrinkWrap: true,
        children: <Widget>[
          Material(
              color: (drawer_list.bbc_urdu)?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.bbc_urdu=!(drawer_list.bbc_urdu);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/bbc_urdu.png", scale: 2, ), Text('بی بی سی اردو', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (drawer_list.daily_ausaf)?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.daily_ausaf=!(drawer_list.daily_ausaf);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/daily_ausaf.png", scale: 2, ), Text('روزنامہ اوصاف', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (drawer_list.daily_khabrain)?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.daily_khabrain=!(drawer_list.daily_khabrain);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/daily_khabrain.png", scale: 2, ), Text('روزنامہ خبریں', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (drawer_list.daily_pak_urdu)?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.daily_pak_urdu=!(drawer_list.daily_pak_urdu);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/daily_pak_urdu.png", scale: 2, ), Text('روزنامہ پاکستان', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (drawer_list.dawn_urdu)?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.dawn_urdu=!(drawer_list.dawn_urdu);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/dawn_urdu.png", scale: 2, ), Text('ڈان نیوز', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (drawer_list.express_urdu)?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.express_urdu=!(drawer_list.express_urdu);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/express_urdu.png", scale: 2, ), Text('ایکسپریس نیوز', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (drawer_list.javed_chaudhry)?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.javed_chaudhry=!(drawer_list.javed_chaudhry);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/javed_chaudhry.png", scale: 2, ), Text('جاوید چوہدری', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (drawer_list.nawaiwaqt)?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.nawaiwaqt=!(drawer_list.nawaiwaqt);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/nawaiwaqt.png", scale: 2, ), Text('نوائے وقت', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (drawer_list.radio_pak_urdu)?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.radio_pak_urdu=!(drawer_list.radio_pak_urdu);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/radio_pak_urdu.png", scale: 2, ), Text('ریڈیو پاکستان', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (drawer_list.roznama_dunya)?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.roznama_dunya=!(drawer_list.roznama_dunya);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/roznama_dunya.png", scale: 2, ), Text('روزنامہ دنیا', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (drawer_list.voice_of_america)?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {drawer_list.voice_of_america=!(drawer_list.voice_of_america);});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/voice_of_america.png", scale: 2, ), Text('وائس آف امریکہ', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
        ],
      ),);
  }
}