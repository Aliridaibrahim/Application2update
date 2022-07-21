
import 'package:dokanj/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/user.dart';
import '../widgets/category_selector.dart';
import '../widgets/favorite_contact.dart';
import '../widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthBase authBase =AuthBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(

        title: Text("WhatsApp",
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
      body:Column(
        children:<Widget> [
          CategorySelector(),
          Expanded(
            child:   Container(
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.lime,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContracts(),
                  RecentChats(),
                ],

              ),
            ),
          )
        ],
      ) ,
    );
  }
}
