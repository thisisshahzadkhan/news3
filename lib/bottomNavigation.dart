import 'package:flutter/material.dart';
import 'language.dart';
class bottomNavigation extends StatefulWidget{
  var route;
  bottomNavigation_state createState()=>bottomNavigation_state();
  bottomNavigation(x){route=x;}
}

class bottomNavigation_state extends State<bottomNavigation>{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        //currentIndex: 2,
        fixedColor: Colors.black,
        onTap: (arg){
          if(arg==0)
            Navigator.of(context).pushReplacementNamed('/home');
          else if (arg==1)
            Navigator.of(context).pushReplacementNamed('/trending');
          else if(arg==2)
            Navigator.of(context).pushReplacementNamed('/archives');
          else if(arg==3){
            setState(() {
              if(language.lang=="English"){language.lang="Urdu";} else language.lang="English";
              Navigator.pushReplacementNamed(context, widget.route);
            });
          }
        },
        type: BottomNavigationBarType.fixed,

        items: [BottomNavigationBarItem(
          icon: new Image.asset((widget.route=='/home')?'assets/newsfill.png':'assets/newsoutline.png',scale: 20.0,),
          title: new Text('News',style: TextStyle(color: Color(0xff9A9A9A)),),
        ),
        BottomNavigationBarItem(
          icon: new Image.asset((widget.route=='/trending')?'assets/trendingfill.png':'assets/trendingoutline.png',scale: 20.0,),
          title:  new Text('Trending',style: TextStyle(color: Color(0xff9A9A9A)),),
        ),
        BottomNavigationBarItem(
          icon: new Image.asset((widget.route=='/archives')?'assets/archivefill.png':'assets/archiveoutline.png',scale: 20.0,),
          title: new Text('Archives',style: TextStyle(color: Color(0xff9A9A9A)),),
        ),
        BottomNavigationBarItem(
          icon: new Image.asset((language.lang=="English")?'assets/urdu.png':'assets/eng.png',scale: 20.0,),
          title: new Text('Language',style: TextStyle(color: Color(0xff9A9A9A)),),
        ),
        ]);
  }
}