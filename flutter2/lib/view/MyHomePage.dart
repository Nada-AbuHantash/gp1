import 'package:flutter/material.dart';
import 'package:flutter2/components/applocal.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/editprofile.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/homecust.dart';
import 'package:flutter2/view/profile.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'about/abo2.dart';
import 'logintest.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 30),
          ListTile(
            leading: Icon(Icons.person,color: globalcolors.textcolor),
            title: Text('Profile',style: TextStyle(color: globalcolors.textcolor)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const profile()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.language,color: globalcolors.textcolor),
            title: Text('Language',style: TextStyle(color: globalcolors.textcolor)),
            onTap: () => {
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const homecust()),
            )
              },
          ),

          ListTile(
            leading: Icon(Icons.info_outline,color: globalcolors.textcolor),
            title: Text('About us',style: TextStyle(color: globalcolors.textcolor)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const About()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color,color: globalcolors.textcolor),
            title: Text('Feedback',style: TextStyle(color: globalcolors.textcolor)),
            onTap: () => {

            showDialog(
            context: context,
            builder: (BuildContext context) =>
            AlertDialog(

            actions: [
            const SizedBox(height: 20),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              const SizedBox(height: 20),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
            child: ElevatedButton(

            style: ElevatedButton.styleFrom(

            shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(20.0)),
            foregroundColor: globalcolors.maincolor,
            backgroundColor: globalcolors.notetcolor,
            minimumSize: const Size(250, 50),
            ),
            child: Text("${getLang(context, "feed")}",
            style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
            ),
            onPressed: ()  {
            ////the value of the rate in rating **added it to the database
            },
            ),
            ),


            ],

            ),
            ),

            const SizedBox(height: 20),

            ],

            )),
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app,color: globalcolors.textcolor),
            title: Text('Logout',style: TextStyle(color: globalcolors.textcolor)),
            onTap: () => {

              showDialog(
              context: context,
              builder: (BuildContext context) =>
                  AlertDialog(

                    actions: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: ElevatedButton(

                                style: ElevatedButton.styleFrom(

                                  shape: RoundedRectangleBorder(

                                      borderRadius: BorderRadius.circular(20.0)),
                                  foregroundColor: globalcolors.maincolor,
                                  backgroundColor: globalcolors.notetcolor,
                                  minimumSize: Size(250, 50),
                                ),
                                child: Text("${getLang(context, "Cou")}",

                                  style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
                                ),
                                onPressed: ()  {
                                  navigator?.push(MaterialPageRoute(builder: (_)=>NavDrawer()));

                                   },
                              ),
                            ),


                          ],

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: ElevatedButton(

                                style: ElevatedButton.styleFrom(

                                  shape: RoundedRectangleBorder(

                                      borderRadius: BorderRadius.circular(20.0)),
                                  foregroundColor: globalcolors.maincolor,
                                  backgroundColor: globalcolors.notetcolor,
                                  minimumSize: const Size(250, 50),
                                ),
                                child: Text("${getLang(context, "logout")}",
                                  style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
                                ),
                                onPressed: ()  {
                                  navigator?.push(MaterialPageRoute(builder: (_)=>home()));
                                   },
                              ),
                            ),


                          ],

                        ),
                      ),

                      const SizedBox(height: 20),

                    ],

                  )

          ),

            },
          ),
        ],
      ),
    );
  }
}