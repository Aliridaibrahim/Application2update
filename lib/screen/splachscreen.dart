import 'dart:async';

import 'package:dokanj/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';


String finalEmail;
class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 1),()=>
      (finalEmail == null ? Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context) {
            return LoginPage();
          })) :Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context) {
            return HomeScreen();
          })
      )
      )
      );

    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var obtaineEmail = sharedPreferences.getString("email");
    setState(() {
      finalEmail = obtaineEmail;
    });
    print(finalEmail);
  }


  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: (
            Center(
              child: CircularProgressIndicator(backgroundColor: Colors.black,),
            )
        )
    );
  }
}
