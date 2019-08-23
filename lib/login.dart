import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class mylogin extends StatefulWidget{
  String email,password;
  loginState createState()=> loginState();

}
class loginState extends State<mylogin>with TickerProviderStateMixin {
  var email,password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.3,0.5,0.7, 10],
          colors: [
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Color(0xff4268D3),
          ],
        ),
      ),
      child: ListView(
          //shrinkWrap: true, //center
          padding: EdgeInsets.only(left: 10.0,right: 10.0),
          children: <Widget>[
            ///////////////image
            Image(
              image: AssetImage('assets/icon.png'),
              height:250,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 10.0),
            //////////////Email
            TextField(
              onChanged: (input){email=input;},
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "Email", labelText: "Email",
                  labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0,20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
              ),
            ),
            SizedBox(height: 10.0),
  //////////////////////////////////////        /////////////password
            TextField(
              onChanged: (input){password=input;},
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password", hintText: "Password",
                  labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0,20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
              ),
            ),
            SizedBox(height: 5.0),
////////////////////////////// FORGOt PASSWORD         //////
            Container(
              alignment: Alignment(1.0, 0.0),
              padding: EdgeInsets.only(top: 5.0, left: 20.0),
              child: InkWell(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        content: Container(
                          child: Column(
                            /*crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,*/
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                            //////////ALERT TITLE
                            Text('Enter your email here to reset your password',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 30),
                            //////////ALERT Email
                            TextField(autofocus: true,
                              onChanged: (input){email=input;},
                              decoration: InputDecoration(
                                  hintText: "Email", labelText: "Email",
                                  labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey),
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0,20.0, 10.0),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
                              ),
                            ),
                            SizedBox(height: 20.0),
                            //////////ALERT Button
                            Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.blue,
                              color: Color(0xff4268D3),
                              elevation: 7.0,
                              child: MaterialButton(
                                onPressed:() {
                                  _forget_request(email);
                                  Navigator.pop(context);
                                },
                                child: Center(
                                  child: Text('Submit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )
                          ],),
                        ),
                      ));
                },
                child: Text('Forgot Password',
                  style: TextStyle(color: Color(0xff4268D3), fontWeight: FontWeight.bold, fontFamily: 'Montserrat', decoration: TextDecoration.underline),
                ),
              ),
            ),
            SizedBox(height: 15.0),
///////////////////////////////////////////////          //login_button
            Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.blue,
                  color: Color(0xff4268D3),
                  elevation: 7.0,
                  child: MaterialButton(
                    onPressed:() {_login(email, password);},
                    child: Center(
                      child: Text('SIGN IN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 20.0),
/////////////////////////////////////////////////FACEBOOK LOGIN BUTTON
            /*Container(
                height: 40.0,
                decoration: BoxDecoration(
                border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 1.0), color: Colors.transparent, borderRadius: BorderRadius.circular(20.0)),
                child:MaterialButton(
                    onPressed:() {
                    //  _facebook_login();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(child:Image.asset('assets/facebook_logo.png',scale: 5,)),
                        Center(child: Text('Login with Facebook', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),)),
                    ],
                    ),
                  ),
                ),*/
            SizedBox(height: 50.0),
 /////////////////////////////////////////////////////REGISTER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New to NewsHunt ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Color(0xff4268D3),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ),
    ),
  );
  }

  ////////////Shared preferences
  _sharedPreferences (String oauth_uid,String oauth_provider,String fname,String lname)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('oauth_uid',oauth_uid);
    prefs.setString('oauth_provider',oauth_provider);
    prefs.setString('name',fname+" "+lname);
  }
  ///////////login
  _login(var email,var password) async{
   await http.post('https://newshunt.io/mobile/newsHunt_login.php',body: {'username':email,'password':password})
        .then((response){
      String body = response.body;

      if("${response.body}".contains("notactivated")){
          Toast.show('Your Account Is Not Activated Yet, Check Your Email !', context);
          }
        else if(body.contains("Not Found")){
          Toast.show('Not Found !', context);
          }
        else if("${response.body}".contains("id")){
        Toast.show('Welcome !', context,duration: Toast.LENGTH_LONG);
        print("${response.body}");
            var resp_json = json.decode("${response.body}");
            print(resp_json[0]['id'].toString());
            _sharedPreferences(resp_json[0]['oauth_uid'].toString(),
                resp_json[0]['oauth_provider'].toString(),
                resp_json[0]['fname'].toString(),
                resp_json[0]['lname'].toString()
            );
            Navigator.pushReplacementNamed(context, '/home');
        }

    }).catchError((error){print('Error');});
  }
 /*_facebook_login() async{
    print('fjashfjkashf');
    var facebook=FacebookLogin();
    var facebookLoginResult=await facebook.logInWithReadPermissions(['email']);
    switch(facebookLoginResult.status){
      case FacebookLoginStatus.loggedIn:
        print("FB osho");
        break;
      case FacebookLoginStatus.error:
        print("onasho");
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('canceled bt the user');
        break;
    }
 }*/
  _forget_request(var email){
    http.post('',body: {'':email}).then((response){
      Toast.show('Your Account Is Not Activated Yet, Check Your Email !', context);

    });
  }
}