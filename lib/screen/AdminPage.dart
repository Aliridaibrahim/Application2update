import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/user.dart';
import 'login.dart';


class AdminPage extends StatelessWidget {
  AuthBase authBase =AuthBase();
  static String id = 'AdminHome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: Text("AdminPage",
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold
          ),

        ),
        elevation:0 ,
        actions:<Widget> [

          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30,
            color: Colors.white,
            onPressed:(){} ,
          ),
        ],
      ),drawer:
    Drawer(
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () async{
                  SharedPreferences pref =
                  await SharedPreferences.getInstance();
                  pref.clear();
                  await authBase.logout();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>
                          LoginPage()));
                },

                icon: Icon(Icons.exit_to_app,color: Colors.blue,),)

          )
        ],
      ),
    ),
      body: Container(
        child: Center(
          child: Text("AdminPage",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.green
          ),),
        ),

    )
    );
  }
}
