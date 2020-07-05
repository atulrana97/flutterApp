import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './HomePage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth fireBaseAuth= FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading;
  bool isLogedin = false  ;

  @override
  void initState(){
    super.initState();
    isSignedIn();
      }

    void isSignedIn() async{
          setState((){
            loading = true;
          });
          preferences = await SharedPreferences.getInstance();
          isLogedin = await googleSignIn.isSignedIn();
          if(isLogedin){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
          }
          setState(() {
            loading = false;
          });
    }
    
    @override
    Widget build(BuildContext context) {
      return Container(
        
      );
    }
    
      
}
