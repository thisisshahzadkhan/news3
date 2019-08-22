import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';

class signup extends StatefulWidget{
  var firstnamehint='First Name',lastnamehint='Last Name',emailhint='Email',passwordhint='Password';
  signup_state createState()=>signup_state();
}
class signup_state extends State<signup>{
  var firstname,lastname,email,password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
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
          padding: EdgeInsets.only(top: 5.0,left: 10.0,right: 10.0),
          children: <Widget>[
            Image(
              image: AssetImage('assets/icon.png'),
              height:250,
              width: MediaQuery.of(context).size.width,
            ),
            ///////////////////////////first name
            TextField(
              onChanged: (input){firstname=input;},
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "First Name", labelText: "First Name",
                  labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0,20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
              ),
            ),
            SizedBox(height: 20,),
            ///////////////////////////LAST name
            TextField(
              onChanged: (input){lastname=input;},
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "Last Name", labelText: "Last Name",
                  labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0,20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
              ),
            ),
            SizedBox(height: 20,),
            ///////////////////////////Email
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
            SizedBox(height: 20,),
            ///////////////////////////Password
            TextField(
              onChanged: (input){password=input;},
              autofocus: false,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password", labelText: "Password",
                  labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0,20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
              ),
            ),
            SizedBox(height: 10,),
            /////////////////////////////Sign UP button
            Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.blue,
                  color: Color(0xff4268D3),
                  elevation: 7.0,
                  child: MaterialButton(
                    onPressed:() {_signup(firstname,lastname,email,password);},
                    child: Center(
                      child: Text('SIGN UP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                )),
           /////////////////home
            SizedBox(height: 40,),
            InkWell(
              onTap: (){
                Navigator.pushReplacementNamed(context, '/home');},
              child: Center(child: Text('Go back to Home',style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.black,decoration: TextDecoration.underline),)),)
          ],
        ),
      ),
    );
  }

 _signup(var _firstname,var _lastname,var _email,var _password,)async {
   //https://newshunt.io/mobile/newsHunt_signup.php

  await http.post('https://newshunt.io/mobile/newsHunt_signup.php',body: {'firstname':_firstname,'lastname':_lastname,'email':_email,'password':_password,})
      .then((response){
        if("${response.body}".contains('already exist')){
          print("already exist");
          Toast.show('Already Exist', context,gravity: Toast.TOP);
        }
        else if("${response.body}".contains('successful')){
          print("Successful :)");
          Toast.show('Successful :) , You will receive Activiation Email shortly!', context,gravity: Toast.TOP,duration: Toast.LENGTH_LONG);
          Navigator.pushReplacementNamed(context, '/home');
        }
  });
  }
}