import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/view/editprofail.dart';
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
                'Dear driver,',
                  style: TextStyle(
                      color:globalcolors.textcolor,
                      fontWeight:  FontWeight.bold, fontSize: 25,),
                ), 
                 SizedBox(height: 45,),
                  Text(
                ' welcome to the SALE app , In this application, you will use your car or bike to deliver orders from stores to customers in your area.\n You can get money quickly and take advantage of your free time. If you are a professional driver with a clean record of accidents and problems, and you want to participate with us in this application, just complete the necessary procedures to get an account. and we will contact you soon through our administrator',
                style: TextStyle(
                      color:globalcolors.textcolor,
                      fontWeight:  FontWeight.bold, fontSize: 18,),
                ),
                SizedBox(height: 90),
                Text(
                  "ً* You must set a budget to make it easier for us to deal with profits.",
                  style: TextStyle(
                      color:globalcolors.notetcolor,
                      fontWeight:  FontWeight.normal, fontSize: 15),
                ),
                SizedBox(height: 12,),
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
                    child: Text("I agree",
              style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
              ),
                      onPressed: ()  {  
                       

                         if( niscntoraler.text.isNotEmpty  )
                       {
                          putcard(niscntoraler.text);
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
