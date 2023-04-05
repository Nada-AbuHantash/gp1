import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/profile.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/login.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter2/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/applocal.dart';
import 'about/about.dart';


class seller extends StatefulWidget {
    const seller({Key?key}):super(key: key);


  @override
  State<seller> createState() => _sellerState();
}

class _sellerState extends State<seller> {
    final TextEditingController niscntoraler = TextEditingController();
final TextEditingController namesupercntoraler = TextEditingController();
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
              children: <Widget>[
               SizedBox(height: 45,),
                 Text(
                  'Dear seller,',
                  
                  style: TextStyle(
                      color:globalcolors.textcolor,
                      fontWeight:  FontWeight.bold, fontSize: 25,),
                ), 
                 SizedBox(height: 45,),
                  Text(
                      'welcome to the SALE app ,'
                      ' in this app we offers to you the fastest way to show and sell your product ,'
                      'by Adding the product, and then we take care of advertising '
                      'and delivering it to the largest number of customers in your area ,'
                      ' All this for a small price that you pay us for these services ,'
                      'It will be a small percentage of each product you add to your'
                      ' list and it is predetermined by us ,'
                      'If you agree to this You can complete the procedures and we '
                      'will contact you personally by our administrator in your store.',
                  style: TextStyle(
                      color:globalcolors.textcolor,
                      fontWeight:  FontWeight.bold, fontSize: 18,),
                ),
                SizedBox(height: 60),
                Text(
                  "ً* You must set a budget to make it easier for us to deal with profits.and your name os supermarket",
                  style: TextStyle(
                      color:globalcolors.notetcolor,
                      fontWeight:  FontWeight.normal, fontSize: 15),
                ),
                SizedBox(height: 10,),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                   Flexible(
                 child: Column(
                    children:<Widget> [
                      
                  Container( child:
                     textfiledformat(
                    controller: niscntoraler,
                    text: "your wallet",
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
               SizedBox(height: 10,),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                   Flexible(
                 child: Column(
                    children:<Widget> [
                      
                  Container( child:
                     textfiledformat(
                    controller: namesupercntoraler,
                    text: "Supermarket name",
                    obscure: false,
                    textInputType: TextInputType.text,
                    icon: new Icon(Icons.maps_home_work_outlined),

                  ),
                  )
                    ],
                    
                  ),
                   ),
                   
                ],
              ),
              SizedBox(height: 10,),
                  Padding(
              padding: EdgeInsets.all(8.0),
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
                       minimumSize:  Size(250, 50), 
                    ),
                    child: Text("I agree",
              style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
              ),
                      onPressed: ()  {  if( niscntoraler.text.isNotEmpty && namesupercntoraler.text.isNotEmpty )
                       {
                          putcard(namesupercntoraler.text,niscntoraler.text);
      }else{Fluttertoast.showToast(msg: "${getLang(context, "somefiled")}",
          textColor: globalcolors.besiccolor);}
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
  
 putcard(String name, String card)async {
final prefs = await SharedPreferences.getInstance();
  String nameperson= prefs.get("emailemail").toString();
var res=await fetch1.sellercard1(name,card,nameperson).then((res) {

print(res.toString());
Route route=MaterialPageRoute(builder: (_)=>home());
      navigator?.pushReplacement(route);


   
});
}
}
