import 'package:flutter/material.dart';
import 'news_page.dart' as news_page;
import 'language.dart';
import 'urdunewsgrid.dart';
import 'englishInternationalgrid.dart';
import 'bottomNavigation.dart';
import 'floating_button.dart';
class trending extends StatefulWidget{

  home_state  createState()=> home_state();
}



class home_state extends State<trending>{
  TabController tabController;
  @override
  void initState() {super.initState();
  tabController=new TabController(length: 3, vsync:AnimatedListState());
  }
  @override
  void dispose() {super.dispose();
  tabController.dispose();
    //tabController_bottom.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //endDrawer: (language.lang=="Urdu")?drawer_urdu():drawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Trending',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          bottom: new TabBar(
              unselectedLabelColor: Color(0xff9A9A9A),
              labelColor: Color(0xff4268D3),
              controller: tabController,
              tabs: [
                new Tab(text: 'Today'),
                new Tab(text: 'This Week'),
                new Tab(text: 'This Month'),
              ]
          ),
        ),

        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: <Widget>[
        new news_page.news_page('https://newshunt.io/mobile/get_trending.php?lang=english&category=&source=&last_id=&loaded=0&type=today&lang='+language.lang),
        new news_page.news_page('https://newshunt.io/mobile/get_trending.php?lang=english&category=&source=&last_id=&loaded=0&type=thisweek&lang='+language.lang),
        new news_page.news_page('https://newshunt.io/mobile/get_trending.php?lang=english&category=&source=&last_id=&loaded=0&type=thismonth&lang='+language.lang)
            ]),
        ///////////////////////////FAB
        floatingActionButton: floating_button(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar:bottomNavigation('/trending')
      /*BottomNavigationBar(
            currentIndex: 1,
            fixedColor: Colors.black,
            onTap: (arg){
              //ON BOTTOM NAVIGATION CHANGED
              if(arg==0)
              Navigator.of(context).pushReplacementNamed('/home');
              else if(arg==2)
                Navigator.of(context).pushReplacementNamed('/archives');
              else if(arg==3){
                setState(() {
                  if(language.lang=="English"){language.lang="Urdu";}
                  else{language.lang="English";}
                  Navigator.pushReplacementNamed(context, "/trending");
                });
              }
            },
            type: BottomNavigationBarType.fixed,
            items: [BottomNavigationBarItem(
              icon: new Image.asset('assets/newsoutline.png',scale: 20.0,),
              title: new Text('News'),
            ),
            BottomNavigationBarItem(
              icon: new Image.asset('assets/trendingfill.png',scale: 20.0,),
              title:  new Text('Trending'),
            ),
            BottomNavigationBarItem(
              icon: new Image.asset('assets/archiveoutline.png',scale: 20.0,),
              title: new Text('Archive'),
            ),
            BottomNavigationBarItem(
              icon: new Image.asset('assets/language.png',scale: 20.0,),
              title: new Text('Language'),
            ),
            ])*/
    );
  }

}