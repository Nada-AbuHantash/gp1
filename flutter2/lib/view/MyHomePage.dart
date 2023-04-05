import 'package:flutter/material.dart';
import 'package:flutter2/components/applocal.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/editprofile.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/homecust.dart';
import 'package:flutter2/view/profile.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

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
            title: Text('Profile'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const profile()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.language,color: globalcolors.textcolor),
            title: Text('Language'),
            onTap: () => {
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const homecust()),
            )
              },
          ),

          ListTile(
            leading: Icon(Icons.info_outline,color: globalcolors.textcolor),
            title: Text('About us'),
            onTap: () => {
              //Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color,color: globalcolors.textcolor),
            title: Text('Feedback'),
            onTap: () => {
            //  Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app,color: globalcolors.textcolor),
            title: Text('Logout'),
            onTap: () => {

              showDialog(
              context: context,
              builder: (BuildContext context) =>
                  AlertDialog(
                   // title:
                    //Text("${getLang(context, "singass")}"),
                   // titleTextStyle: TextStyle(color: globalcolors.notetcolor,fontSize: 20),
                  //  backgroundColor: globalcolors.besiccolor,

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