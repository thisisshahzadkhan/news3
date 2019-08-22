import 'package:flutter/material.dart';
import 'news_page.dart' as news_page;
import 'englishInternationalgrid.dart';
import 'urdunewsgrid.dart';
import 'language.dart';
import 'bottomNavigation.dart';
import 'floating_button.dart';
import 'appdrawr.dart';
class home extends StatefulWidget{
  Text text=Text("");

  home_state  createState()=> home_state();
}



class home_state extends State<home>{
  TabController tabController;

  @override
  void initState() {super.initState();
  tabController=new TabController(length: 8, vsync:AnimatedListState());
  }
  @override
  void dispose() {super.dispose();
  tabController.dispose();
    //tabController_bottom.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///app drawer
      endDrawer: appdrawr(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('News',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        bottom: TabBar(
            unselectedLabelColor: Color(0xff9A9A9A),
            labelColor: Color(0xff4268D3),
            controller: tabController,
            isScrollable: true,
            tabs:[
              new Tab(text: 'Latest'),
              new Tab(text: 'National'),
              new Tab(text: 'World'),
              new Tab(text: 'Sports'),
              new Tab(text: 'Business'),
              new Tab(text: 'Health'),
              new Tab(text: 'Technology'),
              new Tab(text: 'Other'),
            ]
        ),
      ),
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: <Widget>[
            new news_page.news_page('http://newshunt.io/mobile/get_latest.php?lang='+language.lang),
            new news_page.news_page('http://newshunt.io/mobile/get_latest.php?category=national&lang='+language.lang.toString()),
            new news_page.news_page('http://newshunt.io/mobile/get_latest.php?category=world&lang='+language.lang.toString()),
            new news_page.news_page('http://newshunt.io/mobile/get_latest.php?category=sports&lang='+language.lang.toString()),
            new news_page.news_page('http://newshunt.io/mobile/get_latest.php?category=business&lang='+language.lang.toString()),
            new news_page.news_page('http://newshunt.io/mobile/get_latest.php?category=health&lang='+language.lang.toString()),
            new news_page.news_page('http://newshunt.io/mobile/get_latest.php?category=technology&lang='+language.lang.toString()),
            new news_page.news_page('http://newshunt.io/mobile/get_latest.php?category=other&lang='+language.lang.toString()),
          ]),
      ///////////////////////////FAB
      floatingActionButton: floating_button(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /////////////////////BOTTOM NAVIGATION
      bottomNavigationBar:bottomNavigation('/home'),
      //drawer:_buildDrawer(),
    );
  }
}