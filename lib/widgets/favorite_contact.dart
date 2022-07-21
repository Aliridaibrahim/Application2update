
import 'package:flutter/material.dart';

import '../model/message_model.dart';
import '../screen/chat_screen.dart';

class FavoriteContracts extends StatelessWidget {
 // const FavoriteContracts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.symmetric(vertical: 10,),
      child: Column(
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:20 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Text("FAvorite Contacts",style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,

                ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)
                  ,iconSize: 30,
                  color: Colors.blueGrey,
                )
              ],
            ),
          ),
          Container(
            height: 120,
            // color: Colors.blue,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                itemCount: favorites.length,
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap:()=>Navigator.push(context,
                        MaterialPageRoute(builder:(_)=>ChatScreen(user :favorites[index]))) ,
                    child: Padding(
                      padding:  EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage :AssetImage(favorites[index].imageUrl) ,
                          ),
                          SizedBox(height: 6,),
                          Text(favorites[index].name
                            ,style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 16
                            ),),
                        ],
                      ),
                    ),
                  );

                }),
          ),
        ],
      ),
    );
  }
}
