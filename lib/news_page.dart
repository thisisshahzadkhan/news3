import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toast/toast.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/animation.dart';
import 'package:share/share.dart';
import 'language.dart';
import 'auth.dart';

class news_page extends StatefulWidget{
  var x;
  int Index=0;
  var url="";
  var coldicon='assets/uncold.png';
  var hoticon='assets/unhot.png';
  var archivesicon='assets/unarchive.png';
  var cold_array=[];
  //List<int> cold_array=[14];
  var hot_array=[];
  double swipe_opacity=1.0;
  List<String> stack=new List();
  String image_asset_link="assets/icon.png";
  String category_image="assets/catworld.png";

  news_page(agr1){url=agr1;}
  news createState()=> news();
}

class news extends State<news_page> with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController animationControler;

  //NEWS SOURCE CHECKING FOR NEWS LOGO
  check_source(String str){
    switch(str){
      case "Dawn": widget.image_asset_link="assets/dawn.png";break;
      case "CNN News": widget.image_asset_link="assets/cnn_news.png";break;
      case "The Times of India": widget.image_asset_link="assets/times_of_india.png";break;
      case "Daily Times": widget.image_asset_link="assets/daily_times.png";break;
      case "Business Recorder": widget.image_asset_link="assets/business_recorder.png";break;
      case "The Nation": widget.image_asset_link="assets/the_nation.png";break;
      case "The News International": widget.image_asset_link="assets/the_news.png";break;
      case "The News Tribe": widget.image_asset_link="assets/the_news_tribe.png";break;
      case "The Express Tribune": widget.image_asset_link="assets/express_tribune.png";break;
      case "Pakistan Observer": widget.image_asset_link="assets/pak_observer.png";break;
      case "Pakistan Today": widget.image_asset_link="assets/pak_today.png";break;
      case "Radio Pakistan": widget.image_asset_link="assets/radio_pak.png";break;
      case "The Frontier Post": widget.image_asset_link="assets/frontier_post.png";break;
      case "Daily Pakistan": widget.image_asset_link="assets/daily_pak.png";break;
      case "بی بی سی اردو": widget.image_asset_link="assets/bbc_urdu.png";break;
      case "روزنامہ اوصاف": widget.image_asset_link="assets/daily_ausaf.png";break;
      case "روزنامہ خبریں": widget.image_asset_link="assets/daily_khabrain.png";break;
      case "روزنامہ پاکستان": widget.image_asset_link="assets/daily_pak_urdu.png";break;
      case "ڈان نیوز": widget.image_asset_link="assets/dawn_urdu.png";break;
      case "ایکسپریس نیوز": widget.image_asset_link="assets/express_urdu.png";break;
      case "جاوید چوہدری": widget.image_asset_link="assets/javed_chaudhry.png";break;
      case "نوائے وقت": widget.image_asset_link="assets/nawaiwaqt.png";break;
      case "ریڈیو پاکستان": widget.image_asset_link="assets/radio_pak_urdu.png";break;
      case "روزنامہ دنیا": widget.image_asset_link="assets/roznama_dunya.png";break;
      case "وائس آف امریکہ": widget.image_asset_link="assets/voice_of_america.png";break;
      case "حسن نثار": widget.image_asset_link="assets/hussan_nisar.png";break;
    }
  }
  //////////////////////////////check catagory
  check_category(String cat){
    print(cat);
    switch(cat){
      case 'Sports':widget.category_image='assets/catsports.png';break;
      case 'World':widget.category_image='assets/catworld.png';break;
      case 'Technology':widget.category_image='assets/cattech.png';break;
      case 'Health':widget.category_image='assets/cathealth.png';break;
      case 'National':widget.category_image='assets/catnational.png';break;
      case 'Business':widget.category_image='assets/catbusiness.png';break;
      case 'Life & Style':widget.category_image='assets/catstyle.png';break;
      }
  }
  /////////////////////InitState
  /*@override
  void initState() {
    super.initState();
    animationControler=AnimationController(duration:Duration(seconds: 2),vsync: this);
    animation=Tween(begin: -0.1,end: 0.0).animate(CurvedAnimation(parent: animationControler, curve: Curves.fastOutSlowIn));
    animationControler.forward();
  }*/
///////////auth check
  _sharedPreferences ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String oauth_uid=prefs.getString('oauth_uid');
    String oauth_provider=prefs.getString('oauth_provider');
    String name=prefs.getString('name');
    if (oauth_uid==null||oauth_provider==null||name==null){
      auth.login=false;
      auth.oauth_uid=null;
      auth.oauth_provider=null;
      auth.name=null;
    }
    else{
      print('auth is set');
      auth.login=true;
      auth.oauth_uid=oauth_uid;
      auth.oauth_provider=oauth_provider;
      auth.name=name;
    }
  }

  @override
  void initState() {
    _sharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    final double width=MediaQuery.of(context).size.width;
        return Scaffold(
          //body
      body:GestureDetector(
          onTap: (){print('its a tap'); setState(() {widget.swipe_opacity=0.0;});},
          onHorizontalDragEnd: (d) {
            setState(() {
              widget.coldicon='assets/uncold.png';
              widget.hoticon='assets/unhot.png';
              if (d.primaryVelocity >= 1) {
                if (widget.Index > 0) {widget.Index--;}
                else{
                  Toast.show("You are already viewing the latest news!", context);
                }
              }
              else if (d.primaryVelocity <= -1) {
                if (widget.Index < 49) {widget.Index++;}
                else{
                  Toast.show("No more news available for now!", context);
                }
              }
            });
          },
          //FUTURE BUILDER
                  child:Container(
                      color: Colors.white,
                      child:Container(
                        child: Container(
                          child: Center(
                            child: Container(
                              child: FutureBuilder(
                future: _news_data(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null||snapshot.hasError||snapshot.hasData!=true||snapshot.data.length==0) {
                    return Container(child: Center(
                              child: CircularProgressIndicator(),
                    ));
                  }
                  else {
                    print(snapshot.data.length);
                    //////////////////CHECKING SOURCE and SETTING LOGO
                    check_source(snapshot.data[widget.Index].source.toString());
                    //////////////////// setting COLDs
                    //widget.cold_array[widget.Index]=int.parse(snapshot.data[widget.Index].colds);
                    widget.cold_array.add(int.parse(snapshot.data[widget.Index].colds));
                    //////////////////////setting HOTs
                    //widget.swipe_opacity=0.0;
                    //widget.hot_array[widget.Index]=int.parse(snapshot.data[widget.Index].hots);
                    widget.hot_array.add(int.parse(snapshot.data[widget.Index].hots));
                    //////////////////////check category
                    check_category(snapshot.data[widget.Index].category.toString());
     ////////////////////////////////////////////////////////////////////////Main SCREEN
                    return CustomScrollView(
                      slivers: <Widget>[
                        /////image
                        SliverAppBar(
                          backgroundColor: Colors.white,
                          expandedHeight: 250.0,
                          floating: true,
                          //////////SOURCE ICON IN TITLE
                          automaticallyImplyLeading: true,
                          title: Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                              child: Image.asset(widget.image_asset_link,
                                alignment: Alignment.topLeft,)),
                          ///////////////MAIN NEWS IMAGE
                          flexibleSpace: FlexibleSpaceBar(
                            background: Image.network(
                              snapshot.data[widget.Index].media,
                              fit: BoxFit.cover,),
                          ),
                        ),

                     ////////////////////list
                        SliverList(delegate: SliverChildListDelegate(<Widget>[
                          /////////////////////////////////////////// ///////////////////////////////////////ROW
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  IconButton(icon: Image.asset('assets/hot.png'),
                                    onPressed: () {setState(() {
                                      widget.hot_array[widget.Index]+=1;
                                      //widget.hoticon='assets/hot.png';
                                    });
                                    _hot(snapshot.data[widget.Index].id,widget.Index);}, iconSize: 50,),
                                  Text(widget.hot_array[widget.Index].toString(),style: TextStyle(fontFamily: 'Montserrat'))
                                ],),
                              Column(children: <Widget>[
                                IconButton(icon: Image.asset('assets/cold.png'),
                                  onPressed: () {setState(() {
                                    widget.cold_array[widget.Index]+=1;
                                    //widget.coldicon='assets/cold.png';
                                  });
                                  _cold_async(snapshot.data[widget.Index].id,widget.Index);}, iconSize: 50,),
                                Text(widget.cold_array[widget.Index].toString(),style: TextStyle(fontFamily: 'Montserrat'))
                              ],),
                              ///////////////////////archives
                              Column(children: <Widget>[
                                IconButton(icon: Image.asset(widget.archivesicon),
                                  onPressed:(){_archive(snapshot.data[widget.Index].id);} , iconSize: 50,),
                                Text('Archive',style: TextStyle(fontFamily: 'Montserrat'))
                              ],),
                              ///////////////////////share
                              Column(children: <Widget>[
                                IconButton(icon: Image.asset("assets/share.png"),
                                  onPressed: (){
                                    _share('https://newshunt.io/''${language.lang}''/story/''${snapshot.data[widget.Index].id}');
                                  }, iconSize: 50,),
                                Text('Share',style: TextStyle(fontFamily: 'Montserrat'))
                              ],),
                            ],),
                          ////////////////divider
                          Padding(padding: EdgeInsets.only(top: 10),
                              child:Divider(color: Colors.grey,)),
                          /////////////TITLE
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                  20.0, 0.0, 20.0, 10.0),
                              child: Text(snapshot.data[widget.Index].title,
                                style: TextStyle(color: Color(0xff231F20),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,),
                                textDirection: TextDirection.ltr,
                              )),
                          ///////// /////////////category image
                          Padding( padding: EdgeInsets.only(left: 20,right: 20),
                              child:Row(children: <Widget>[Image.asset(widget.category_image,scale: 8,)],)),
                          //PUB DATE
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                  20.0, 5.0, 20.0, 5.0),
                              child: Text(
                                snapshot.data[widget.Index].pub_date, style:
                              TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5),
                                fontSize: 10.0,),
                                textDirection: TextDirection.ltr,
                              )),
                          ///////test
                          //HtmlView(data: snapshot.data[widget.Index].body,),
                          //////////BODY
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                8.0, 10.0, 8.0, 10.0),
                                child: Html(data:snapshot.data[widget.Index].body.toString()),
                          ),

                        ])),
                      ],
                    );
                  }
                },
              ),
                            ),
                          ),
                        ),
                      )),
                  /*));}
          )*/
      ),
    );

  }

  //////////////////////////////archive
  _archive(var news_id)async{
    if(auth.login){
    http.post('https://newshunt.io/mobile/set_archieves.php',body: {'oauth_provider':auth.oauth_provider,'oauth_uid':auth.oauth_uid,'news_id':news_id})
        .then((response){
          print('${response.body}');
          Toast.show('${response.body}', context);
        }).catchError((error){
          print(error);
    });
    }
    else{
      Toast.show("Please login to set archives", context,duration: Toast.LENGTH_LONG);
    }
  }

  /////////////////////////////////////SHARE
  _share(var x) {
    print(x);
    final RenderBox box = context.findRenderObject();
    //Share.share('https://newshunt.io/''${language.lang}''/story/''${snapshot.data[widget.Index].id}',
    Share.share(x,
        sharePositionOrigin: box.localToGlobal(Offset.zero) &
        box.size);
  }

  //////////////////////////////////COLDs
  _cold_async(var id,var index)async{
    await http.post('https://newshunt.io/mobile/insert_colds.php', body:{'news_id':id})
        .then((response) {
      if("${response.body}".contains("exist")){
        setState(() {
          widget.cold_array[index]-=1;
        });
        Toast.show('You Already Added To It !', context);
      }
      else if("${response.body}".contains("done")){
          print(widget.hot_array[index]);
          Toast.show('Done!', context);
      }
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    }).catchError((error) => print(error.toString()));
  }
  ///////////////////////////////////////////////////////HOTs
  _hot(var id,var index)async{
    //https://newshunt.io/mobile/insert_hots.php
    await http.post('https://newshunt.io/mobile/insert_hots.php', body:{'news_id':id})
        .then((response) {
      if("${response.body}".contains("exist")){
        setState(() {widget.hot_array[index]-=1;});
        Toast.show('You Already Added To It !', context);
      }
      else if("${response.body}".contains("done")){
        setState(() {
          print(widget.hot_array[index]);
          Toast.show('Done!', context);
        });
      }
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    }).catchError((error) => print(error.toString()));
  }



  //FUTURE / ASYNC DATA CALL
  Future<List<news_data>> _news_data () async{
    var data= await http.get(widget.url);
    print(widget.url);
     var json_data=json.decode(data.body);
     List<news_data> news_data_list=[];
     for (var n in json_data){
        news_data data=news_data(n["id"],n['title'], n['body'],n['media'],n['url'],n['pub_date'],
            n['source'],n['category'],n['hots'],n['colds']);
        news_data_list.add(data);
     }
     return news_data_list;
  }

}
// DAta Templet
class news_data {
  var id, title, body, media, url, pub_date, source, category,hots,colds;
  news_data(this.id, this.title,this.body,this.media, this.url, this.pub_date,
       this.source, this.category,this.hots,this.colds);

}

//clipper
class DialogonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height-30);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}