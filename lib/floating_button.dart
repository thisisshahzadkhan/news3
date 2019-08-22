import 'package:flutter/material.dart';
import 'filter.dart';
import 'language.dart';
import 'urdunewsgrid.dart';
import 'englishInternationalgrid.dart';
import 'englishRegionalgrid.dart';
class floating_button extends StatefulWidget {
  bool international = true;
  floating_button_state createState()=>floating_button_state();
}

class floating_button_state extends State<floating_button>{

  setbool(bool x){
    setState(() {
      widget.international=x;
    });

  }
  _showDrawer() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              color: Color(0xFF737373),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                ),
                child:
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: language.login? //filter(),
                   ListView(children: <Widget>[
                     Text("Filters",textScaleFactor: 3,textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),),
                     SizedBox(height: 5,),
                     Visibility(visible: (language.lang.contains("English")?true:false), child: Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text("News Type",textScaleFactor: 1.2,style: TextStyle(color: Color(0xff9A9A9A),fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),)],),),
                     Visibility(visible: (language.lang.contains("English")?true:false), child: SizedBox(height: 5,),),
                     Visibility(visible: (language.lang.contains("English")?true:false), child: Row(mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[
                         ///////International
                         InkWell(onTap: (){setState(() {
                           widget.international=true;
                         });print(widget.international);},
                           child: Chip(backgroundColor: Colors.blue[(widget.international)?100:0],label: Text("International",style: TextStyle(color: (widget.international)?Colors.blue:Colors.black, fontWeight:(widget.international)?FontWeight.bold:FontWeight.normal,fontFamily: 'Montserrat'),)),),
                         SizedBox(width: 10,),
                         //////////regional
                         InkWell(onTap: (){setState(() {
                            widget.international=false;
                         }); print(widget.international);},
                           child: Chip(backgroundColor: Colors.blue[(!widget.international)?100:0],label: Text("Regional",style: TextStyle(color: (!widget.international)?Colors.blue:Colors.black, fontWeight:(!widget.international)?FontWeight.bold:FontWeight.normal,fontFamily: 'Montserrat'),)),),
                       ],),),
                      Expanded(child: englishInternationalgrid(),),
                     // Expanded(child: (language.lang.contains("English"))?(widget.international)?englishInternationalgrid():englishRegionalgrid():urdunewsgrid()),
                   ])
                        :Container(
                     height: 250,
                     child: Center(child: Padding(padding: EdgeInsets.all(70),child:
                     Container(
                         height: 40.0,
                         child: Material(
                           borderRadius: BorderRadius.circular(20.0),
                           shadowColor: Colors.blue,
                           color: Color(0xff4268D3),
                           elevation: 7.0,
                           child: MaterialButton(
                             onPressed:() {Navigator.pushReplacementNamed(context, '/login');},
                             child: Center(
                               child: Text('SIGN IN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                               ),
                             ),
                           ),
                         ))),),
                   ),
                 ),
              ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: null,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      child: ClipOval(
        child: Material(
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 5,blurRadius: 5,offset: Offset(5.0, 5.0))]),
            child: InkWell(
              onTap: (){Navigator.pushNamed(context, '/filter');},
              //onTap: (){_showDrawer();},
                child: Image.asset("assets/filters2.png",scale: 10,)),
          ),
        ),
      ),backgroundColor: Color(0xffffff),);
  }



}