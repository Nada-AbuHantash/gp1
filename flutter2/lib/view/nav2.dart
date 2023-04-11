import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/components/applocal.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/editprofile.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/homecust.dart';
import 'package:flutter2/view/profileseller.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../main.dart';
import '../utils/Sharedsession.dart';
import 'about/abo2.dart';

rest_api fetch=new rest_api();
late String cardnada="";
var rate;
bool _lights=false;
var jsonString;

// void _runFilter(String enteredKeyword) {


//  if (enteredKeyword.isEmpty) {
//    getinfo();
// }
// }
//   void getinfo() async {
// jsonString=await fetch.getinfo2();

// if(jsonString !=null){
// cardnada=jsonString.elementAt(0)['sellercard'].toString();
// print(cardnada);}
//   }
class nav2 extends StatefulWidget {


  @override
  State<nav2> createState() => _nav2State();

  
}

class _nav2State extends State<nav2> {

    @override
  void initState() {
    profileseller();
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
    // do something
     getinfo();
    print("Build Completed"); 
  });
  }
   void getinfo() async {
jsonString=await fetch.getinfo2();

if(jsonString !=null){
cardnada=jsonString.elementAt(0)['sellercard'].toString();
print(cardnada);}

  }
  final TextEditingController niscntoraler = TextEditingController();

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
                MaterialPageRoute(builder: (context) => const profileseller()),
              )
            },
          ),
          ListTile(
            title: Text(" ${getLang(context, "contact")}",
                style: TextStyle(color: globalcolors.textcolor)),
            leading: Icon(Icons.call,color: globalcolors.textcolor),
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
                              children:<Widget> [
                                Icon(Icons.call,color: globalcolors.textcolor),
                                SizedBox(width: 5.0),
                          GestureDetector(
                            child:

                            Text(
            " ${getLang(context, "call")}",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: globalcolors.notetcolor,
                              ),
                            ),
                            onTap: () {
                              // Do something when the text is pressed
                              _launchPhoneDialer('0592759118');
                            },
                          ),
            ],
            ),
            ),

                          const SizedBox(height: 20),
                        ],

                      )),
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
            secondary: Icon(Icons.language, color: globalcolors.textcolor), value: true,
          ) ,
          //////////////     /////////////////////////////////////////////////////////////
          ListTile(
            leading: Icon(Icons.wallet,color: globalcolors.textcolor),
            title: Text(" ${getLang(context, "d")}",style: TextStyle(color: globalcolors.textcolor)),
            onTap: () => {
              showDialog(
                
                  context: context,
                  builder: (BuildContext context) =>
                      AlertDialog(
                         title: Text(cardnada,),
                          titleTextStyle: TextStyle(color: globalcolors.textcolor,fontSize: 15),
                        actions: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Flexible(
                                  child: Column(
                                    children:<Widget> [

                                      Container( child:
                                      textfiledformat(
                                        controller: niscntoraler,
                                        text: "${getLang(context, "d")}",
                                        obscure: false,
                                        textInputType: TextInputType.text,
                                        icon: new Icon(Icons.wallet),

                                      ),
                                      )
                                    ],

                                  ),
                                ),

                              ],
                            ),
                          ),

                          const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                           ElevatedButton(

                            style: ElevatedButton.styleFrom(

                              shape: RoundedRectangleBorder(

                                  borderRadius: BorderRadius.circular(20.0)),
                              foregroundColor: globalcolors.maincolor,
                              backgroundColor: globalcolors.notetcolor,
                              minimumSize:  Size(250, 50),
                            ),
                            child: Text("${getLang(context, "selw")}",
                              style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
                            ),
                            onPressed: ()  {
                              updatecard(niscntoraler.text);
                            },
                          ),
            ],

            ),
                  ),
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
                                      navigator?.push(MaterialPageRoute(builder: (_)=>nav2()));

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


  _launchPhoneDialer(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void logout()async {
    Sharedsession shared = new Sharedsession();
    await shared.savename("", "");
    await shared.savenamesuper("");
    navigator?.push(MaterialPageRoute(builder: (_)=>home()));
  }
  
  Future<void> updatecard(String card) async {

    final prefs = await SharedPreferences.getInstance();
  String A = prefs.get("emailemail").toString();
var res=await fetch.updatecard(A,card).then((res) {

if(res==null){  print("Duplication");
AlertDialog alert = const AlertDialog(
         content: Text("something wrong ,not update the data\n,شيئ ما خطأ, لم يتم تعديل المعلومات "),
        );
        
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
}
else{
Fluttertoast.showToast(msg: "${getLang(context, "updatedone")}",
          textColor: globalcolors.besiccolor);
          

}
   
});
  }
}
