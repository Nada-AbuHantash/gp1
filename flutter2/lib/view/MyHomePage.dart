
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/components/applocal.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/editprofile.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/homecust.dart';
import 'package:flutter2/view/profile.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../main.dart';
import '../utils/Sharedsession.dart';
import 'about/abo2.dart';

rest_api fetch=new rest_api();
//final  date = DateTime.now();
var rate;
bool _lights=false;

class NavDrawer extends StatefulWidget {
 

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
   final _auth = FirebaseAuth.instance;
    @override
  void initState() {
    profile();
   
  }
  @override
  Widget build(BuildContext context) {
    var _lights;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 30),
          ListTile(
            leading: Icon(Icons.person,color: globalcolors.textcolor),
            title: Text(" ${getLang(context, "pro")}",style: TextStyle(color: globalcolors.textcolor)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const profile()),
              )
            },
          ),
          ListTile(
             title: Text(" ${getLang(context, "About")}",
             style: TextStyle(color: globalcolors.textcolor)),
            leading: Icon(Icons.info_outline,color: globalcolors.textcolor),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const About()),
              )
            },
          ),

          SwitchListTile(
            
           title: Text("${getLang(context, "lang")}",
           style: TextStyle(color: globalcolors.textcolor)),
           onChanged: (bool value) {
            value: _lights;
       setState(() {
           _lights = value;

        });
        
        if(mySharedPreferences!.getString('translations')=="en"){
          var locale= const Locale("ar","");
            Get.updateLocale(locale);
            _lights=true;
            // language.savelang("ar");
            }
            else if (mySharedPreferences!.getString('translations')=="ar" ){
             var  locale= Locale("en","");
            Get.updateLocale(locale);
            // language.savelang("en");
            _lights=false;
            }
      },
            activeColor: globalcolors.textcolor, // Customize the active color
            inactiveTrackColor: globalcolors.notetcolor,
            secondary: Icon(Icons.language, color: globalcolors.textcolor), value: true,
          ) ,
     //////////////     /////////////////////////////////////////////////////////////
          ListTile(
            leading: Icon(Icons.border_color,color: globalcolors.textcolor),
            title: Text(" ${getLang(context, "feed")}",style: TextStyle(color: globalcolors.textcolor)),
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
              RatingBar.builder(

                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: globalcolors.notetcolor,
                ),
                onRatingUpdate: (rating) {
                  rate=rating ;
                  print(rate);
                },
              ),
            ],
            ),
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
            backgroundColor: globalcolors.besiccolor,
            minimumSize: const Size(250, 50),
            ),
            child: Text("${getLang(context, "feedi")}",
            style: TextStyle(color: globalcolors.textcolor,fontSize: 25),
            ),
            onPressed: ()  {
               feedback(rate);
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
 ///////////////////////////         /////////////////////////////////////////////////////
          ListTile(
            leading: Icon(Icons.exit_to_app,color: globalcolors.textcolor),
            title: Text(" ${getLang(context, "logout")}",style: TextStyle(color: globalcolors.textcolor)),
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
                                  // navigator?.push(MaterialPageRoute(builder: (_)=>home()));
                                  logout();
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

  Future feedback(rate) async {


final prefs = await SharedPreferences.getInstance();
  String A = prefs.get("emailemail").toString();
var res=await fetch.Feedback(rate,A);
  }

 

  void logout()async {
     _auth.signOut();
Sharedsession shared = new Sharedsession();
      await shared.savename("", "");
      await shared.savenamesuper("");
navigator?.push(MaterialPageRoute(builder: (_)=>home()));
  }
}
