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
              color: (filter_list.newsnames.contains('bbc_urdu'))?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('bbc_urdu')?filter_list.newsnames.remove('bbc_urdu'):filter_list.newsnames.add('bbc_urdu');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/bbc_urdu.png", scale: 2, ), Text('بی بی سی اردو', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('daily_ausaf'))?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('daily_ausaf')?filter_list.newsnames.remove('daily_ausaf'):filter_list.newsnames.add('daily_ausaf');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/daily_ausaf.png", scale: 2, ), Text('روزنامہ اوصاف', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('daily_khabrain'))?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('daily_khabrain')?filter_list.newsnames.remove('daily_khabrain'):filter_list.newsnames.add('daily_khabrain');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/daily_khabrain.png", scale: 2, ), Text('روزنامہ خبریں', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('daily_pak_urdu'))?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('daily_pak_urdu')?filter_list.newsnames.remove('daily_pak_urdu'):filter_list.newsnames.add('daily_pak_urdu');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/daily_pak_urdu.png", scale: 2, ), Text('روزنامہ پاکستان', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('dawn_urdu'))?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('dawn_urdu')?filter_list.newsnames.remove('dawn_urdu'):filter_list.newsnames.add('dawn_urdu');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/dawn_urdu.png", scale: 2, ), Text('ڈان نیوز', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('express_urdu'))?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('express_urdu')?filter_list.newsnames.remove('express_urdu'):filter_list.newsnames.add('express_urdu');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/express_urdu.png", scale: 2, ), Text('ایکسپریس نیوز', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('javed_chaudhry'))?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('javed_chaudhry')?filter_list.newsnames.remove('javed_chaudhry'):filter_list.newsnames.add('javed_chaudhry');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/javed_chaudhry.png", scale: 2, ), Text('جاوید چوہدری', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('nawaiwaqt'))?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('nawaiwaqt')?filter_list.newsnames.remove('nawaiwaqt'):filter_list.newsnames.add('nawaiwaqt');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/nawaiwaqt.png", scale: 2, ), Text('نوائے وقت', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('radio_pak_urdu'))?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('radio_pak_urdu')?filter_list.newsnames.remove('radio_pak_urdu'):filter_list.newsnames.add('radio_pak_urdu');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/radio_pak_urdu.png", scale: 2, ), Text('ریڈیو پاکستان', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('roznama_dunya'))?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('roznama_dunya')?filter_list.newsnames.remove('roznama_dunya'):filter_list.newsnames.add('roznama_dunya');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/roznama_dunya.png", scale: 2, ), Text('روزنامہ دنیا', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
          Material(
              color: (filter_list.newsnames.contains('voice_of_america'))?Colors.blue:Colors.grey,
              child: InkWell(  //value: drawer_list.dawn,
                  onTap: (){setState(() {filter_list.newsnames.contains('voice_of_america')?filter_list.newsnames.remove('voice_of_america'):filter_list.newsnames.add('voice_of_america');});},
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: <Widget>[Image.asset("assets/voice_of_america.png", scale: 2, ), Text('وائس آف امریکہ', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)],
                  ))),
        ],
      ),);
  }
}