import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/view/profile.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/applocal.dart';
import 'about/about.dart';


class dil extends StatefulWidget {
  const dil({super.key});


  @override
  State<dil> createState() => _dilState();
}

class _dilState extends State<dil> {
   final TextEditingController niscntoraler = TextEditingController();
   String x='0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalcolors.besiccolor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: 
            <Widget>[
             SizedBox(height: 45,),
                 Text(
                  " ${getLang(context, "del")}",
                  style: TextStyle(

                      color:globalcolors.textcolor,
                      fontWeight:  FontWeight.bold, fontSize: 25,),
                ), 
                 SizedBox(height: 45,),
                  Text(
                "${getLang(context, "deli")}",
                style: TextStyle(
                      color:globalcolors.textcolor,
                      fontWeight:  FontWeight.bold, fontSize: 20,),
                ),
                 SizedBox(height: 90),
                // Text(
                //   "${getLang(context, "de")}",
                //   style: TextStyle(
                //       color:globalcolors.notetcolor,
                //       fontWeight:  FontWeight.normal, fontSize: 18),
                // ),
              //   SizedBox(height: 8,),
              //    Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children:<Widget> [
              //      Flexible(
              //    child: Column(
              //       children:<Widget> [
              //
              //     Container( child:
              //        textfiledformat(
              //       controller: niscntoraler,
              //       text:  "${getLang(context, "d")}",
              //       obscure: false,
              //       textInputType: TextInputType.text,
              //       icon: new Icon(Icons.wallet),
              //
              //     ),
              //     )
              //       ],
              //
              //     ),
              //      ),
              //
              //   ],
              // ),
                SizedBox(height: 10,),
                
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
                       backgroundColor: globalcolors.textcolor,
                       minimumSize: const Size(250, 50), 
                    ),
                    child: Text("${getLang(context, "yes")}",
              style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
              ),
                      onPressed: ()  {  
                       


                          putcard(x);


                           
                       
              },   
                    ),
              ),
              
                 
                ],
            
              ),
            ),
         
            ],
          ),
        ),
        ),
      ),


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
   putcard(String card) async{


    final prefs = await SharedPreferences.getInstance();
  String nameperson= prefs.get("emailemail").toString();
  var res=await fetch1.deliverycard1(card,nameperson).then((res) {

print(res.toString());
Route route=MaterialPageRoute(builder: (_)=>home());
      navigator?.pushReplacement(route);

   
});
  }
}
