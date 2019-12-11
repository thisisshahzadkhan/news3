import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:share/share.dart';
import 'language.dart';

class sentimentAnalysis extends StatefulWidget {
  final String title, sentiment, pubdate, id;
  bool senti = true;

  sentimentAnalysis({Key keyy, this.title, this.sentiment, this.pubdate,this.id})
      :super(key: keyy);

  sentimentAnalysis_state createState()=> sentimentAnalysis_state();

}

class sentimentAnalysis_state extends State<sentimentAnalysis>{
  String currentSelected="All Sentiments";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //share
      floatingActionButton: FloatingActionButton.extended(onPressed: (){_share('');},
          backgroundColor: Colors.grey,
          icon: Icon(Icons.share),
          label: Text('Share')),
      appBar: AppBar(title: Text("News Analysis",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w900),),elevation: 0,backgroundColor: Colors.white,centerTitle: true,),

      body: Container(
        color: Colors.white,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 15,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //sentiment button
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),
                    color: widget.senti?Colors.blueAccent:Colors.white,
                  ),
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    child: Text(' Sentiment Analysis ',style: TextStyle(color: widget.senti?Colors.white:Colors.blueAccent,fontWeight: FontWeight.w600),),
                    onTap: (){setState(() {
                      widget.senti=true;
                      currentSelected="All Sentiments";
                    });},
                  ),),
                //deep analysis button
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topRight: Radius.circular(10)),
                    color: !widget.senti?Colors.blueAccent:Colors.white,
                  ),
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    child: Text(' Deep Analysis ',style: TextStyle(color: !widget.senti?Colors.white:Colors.blueAccent,fontWeight: FontWeight.w600)),
                    onTap: (){setState(() {
                      widget.senti=false;
                      currentSelected='All Analysis';
                    });},
                  ),),
              ],),

            SizedBox(height: 20,),
            /////////divider
            Padding(padding: EdgeInsets.only(top: 0),
                child:Divider(color: Colors.grey,)),
            ////title
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Text(widget.title,style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.w900),textAlign: TextAlign.left,),
            ),
            //PUB DATE
            Padding(
                padding: EdgeInsets.only(left: 10,top: 10),
                child: Text(widget.pubdate,
                  style:
                  TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w900),
                  textDirection: TextDirection.ltr,
                )),
            ////Buttons
            Padding(padding: EdgeInsets.only(left: 10),
                child:(widget.senti)?
                ////sentiment analysis buttons
                Wrap(
                  spacing: 5,
              children: <Widget>[
                //buttonDesign('All Sentiments', Color.fromRGBO(169,169,169,(currentSelected=="All Sentiments")?1.0:0.5)),
                buttonDesign('Positive', Color.fromRGBO(66, 211, 105, (currentSelected=="Positive")?1.0:0.5)),
                buttonDesign('Negative', Color.fromRGBO(220, 53, 69, (currentSelected=="Negative")?1.0:0.5)),
                buttonDesign('Neutral', Color.fromRGBO(255, 195, 91, (currentSelected=="Neutral")?1.0:0.5))
              ],
            ) ////Deep analysis buttons
              :Wrap(
                  spacing: 5,
               children: <Widget>[
                 //buttonDesign('All Analysis', Color.fromRGBO(169,169,169,(currentSelected=="All Analysis")?1.0:0.5)),
                 buttonDesign('Toxicity', Color.fromRGBO(148, 0, 211, 1.0)),
                 buttonDesign('Insult', Color.fromRGBO(112, 112, 112, 1.0)),
                 buttonDesign('Profinity', Color.fromRGBO(255, 200, 38, 1.0)),
                 buttonDesign('Sexuality', Color.fromRGBO(255, 127, 0, 1.0)),
                 buttonDesign('Identity Attack', Color.fromRGBO(0, 0, 255, 1.0)),
                 buttonDesign('Threat', Color.fromRGBO(255, 0, 0, 1.0)),
                 buttonDesign('Flirtation', Color.fromRGBO(84, 145, 203, 1.0)),
               ],

                )),
            ////analysis
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
              child: Html(data: widget.sentiment,
                defaultTextStyle: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),
                customTextAlign: (dom){return TextAlign.justify;},
                customTextStyle:(dom.Node node,TextStyle style){
                  if (node is dom.Element) {
                    switch (node.className) {
                      case "positive_class":
                        return style.merge(TextStyle(color: Color.fromRGBO(66, 211, 105, 1),));
                      case "negative_class":
                        return style.merge(TextStyle(color: Color.fromARGB(255, 255, 67, 1)));
                      case "neutral_class":
                        return style.merge(TextStyle(color: Color.fromRGBO(255, 195, 91, 1)));
                      case "Toxicity":
                        return style.merge(TextStyle(color: Color.fromRGBO(148, 0, 211, 1.0),));
                      case "Insult":
                        return style.merge(TextStyle(color: Color.fromRGBO(112, 112, 112, 1.0),));
                      case "Profinity":
                        return style.merge(TextStyle(color: Color.fromRGBO(255, 200, 38, 1.0)));
                      case "Sexuality":
                        return style.merge(TextStyle(color: Color.fromRGBO(255, 127, 0, 1.0)));
                      case "Identity Attack":
                        return style.merge(TextStyle(color: Color.fromRGBO(0, 0, 255, 1.0)));
                      case "Threat":
                        return style.merge(TextStyle(color: Color.fromRGBO(255, 0, 0, 1.0)));
                      case "Identity Attack":
                        return style.merge(TextStyle(color: Color.fromRGBO(66, 211, 105, 1),));
                      case "Flirtation":
                        return style.merge(TextStyle(color: Color.fromRGBO(84, 145, 203, 1.0)));


                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonDesign(String text, Color color)=>Chip(
    backgroundColor: color,
    label: InkWell(child: Text(text,
      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),onTap: (){setState(() {currentSelected=text;}
    );},),
  );

  _share(var x) {
    print(x);
    final RenderBox box = context.findRenderObject();
    Share.share('https://newshunt.io/''${language.lang}''/story/''${widget.id}',
        sharePositionOrigin: box.localToGlobal(Offset.zero) &
        box.size);
  }
}



