
import 'package:dokanj/model/modelHud.dart';
import 'package:dokanj/provider/google_signin.dart';
import 'package:dokanj/screen/AdminPage.dart';
import 'package:dokanj/screen/homescreen.dart';
import 'package:dokanj/screen/landingPage.dart';
import 'package:dokanj/screen/splachscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return

      ChangeNotifierProvider<GoogleSignInProvider>(create: (context)=> GoogleSignInProvider(),
        //    MaterialApp
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider<ModelHud>(
                  create: (context) => ModelHud())
              ,
              ChangeNotifierProvider<AdminMode>(
                create: (context) => AdminMode(),
              ),




            ],child: MaterialApp(


            debugShowCheckedModeBanner: false,
            // home: NavigationBarPage(),

            home: Splashscreen(),

theme: ThemeData(
  primarySwatch: Colors.red,
),

            routes:<String,WidgetBuilder> {

              'splachscreen': (buildContext)=>LandinPage() ,
              'homesrceen' : (buildContext)=>HomeScreen() ,
              'login': (buildContext)=>LandinPage() ,

              AdminPage.id: (context) => AdminPage(),

            }

        )
        ),
      );

  }


    //   MaterialApp(
    //   title: "Flutter chat",
    //   debugShowCheckedModeBanner: false,
    //   theme : ThemeData(
    //     primarySwatch: Colors.red,
    //     accentColor:  Color(0x00fffef9)
    //   ),
    //   //home: HomeScreen(),
    //
    //     home: Splashscreen(),
    //     routes:<String,WidgetBuilder> {
    //
    //       'splachscreen': (buildContext)=>LandinPage() ,
    //       'homescreen' : (buildContext)=>HomeScreen() ,
    //       'login': (buildContext)=>LandinPage() ,
    //     }
    // );

  }
 // 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
//}
