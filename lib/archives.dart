import 'package:flutter/material.dart';
import 'news_page.dart' as news_page;
import 'language.dart';
import 'bottomNavigation.dart';
import 'floating_button.dart';
import 'auth.dart';
import 'appdrawr.dart';
class archives extends StatefulWidget{
  Text text=Text("");
  archives_state  createState()=> archives_state();
}



class archives_state extends State<archives>{
  TabController tabController;

  @override
  void initState() {super.initState();
  tabController=new TabController(length: 2, vsync:AnimatedListState());
  }
  @override
  void dispose() {super.dispose();
  tabController.dispose();
    //tabController_bottom.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(!auth.login){
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Archives',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(50.0, MediaQuery.of(context).size.height/4, 50.0, 0.0),
          child:Center(
          child: ListView(
              children: <Widget>[
                Text("You are not signed-in", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                  textAlign: TextAlign.center,),
                SizedBox(height: 10.0),
                Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.blue,
                  color: Color(0xff4268D3),
                  elevation: 7.0,
                  child: MaterialButton(
                    onPressed:() {Navigator.pushNamed(context, '/login');},
                    child: Center(
                      child: Text('SIGN IN / SIGN UP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
              ],
          ),
          ),),
          bottomNavigationBar: bottomNavigation('/archives'),
      );

    }
    return Scaffold(
      endDrawer: appdrawr(),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Archives',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),

          /*actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search,color: Colors.black),
              onPressed: (){
                Navigator.pushNamed(context, '/search');
              },
            ),
          ],*/
          bottom: new TabBar(
              unselectedLabelColor: Color(0xff9A9A9A),
              labelColor: Color(0xff4268D3),
              controller: tabController,
              tabs:[
                new Tab(text: 'Newest'),
                new Tab(text: 'Oldest'),
              ]
          ),
        ),
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: <Widget>[
              new news_page.news_page('https://newshunt.io/mobile/get_archieves.php?order=DESC&oauth_uid='+auth.oauth_uid+'&oauth_provider='+auth.oauth_provider),
              new news_page.news_page('https://newshunt.io/mobile/get_archieves.php?order=ASC&oauth_uid='+auth.oauth_uid+'&oauth_provider='+auth.oauth_provider),
            ]),

///////////////////////////FAB
      floatingActionButton: floating_button(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigation('/archives'),
    );
  }
}