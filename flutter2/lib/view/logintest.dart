import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter2/components/applocal.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/init.dart';
import 'package:flutter2/view/widgets/button.dart';
import 'package:flutter2/view/widgets/socialogin.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter2/main.dart';





class logintest extends StatefulWidget {
  const logintest({super.key});

  get emailcntoraler => null;

  get passcntoraler => null;

  @override
  State<logintest> createState() => _logintestState();
}

class _logintestState extends State<logintest> {

  final TextEditingController emailcntoraler= TextEditingController();
  final TextEditingController passcntoraler= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: globalcolors.maincolor,
  body:SingleChildScrollView(
    child: SafeArea(
      child:Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         
            children: [
              
              const SizedBox(height: 70),
             Container(
            alignment: Alignment.center,
             
             //child: Text("${mySharedPreferences!.getString('translations')}",
               child: Text("${getLang(context, "login")}",
             //child: Text('loginbuttun'.tr,
            
              style: TextStyle(
                color: globalcolors.notetcolor,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                   ),
                ),
            ),
          
         const SizedBox(height: 50),
              Text('Login to your acount',

            style: TextStyle(
              color: globalcolors.textcolor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            ),
            const SizedBox(height: 20),
            //// email
            textfiledformat(controller:emailcntoraler,text: 'Email',
            //icon:  Icon(Icons.phone_android,color: globalcolors.textcolor,),
            obscure: false,
            textInputType: TextInputType.emailAddress,icon: new Icon(Icons.search),
            ),
            const SizedBox(height: 15),
            /// pass
             textfiledformat(controller:passcntoraler,
             //icon:  Icon(Icons.phone_android,color: globalcolors.textcolor,),
             text: 'password',
            obscure: true,
            textInputType: TextInputType.text,
            icon: new Icon(Icons.search),
            ),
            const SizedBox(height: 20),
           buttonformat(),
           const SizedBox(height: 20),
           ElevatedButton(
          onPressed: ()  { 
            if(language.getlan()=='en'){
           var locale= Locale('ar','');
            Get.updateLocale(locale);}
            else{
              var locale= Locale('en','');
            Get.updateLocale(locale);
            }
          }, child: Text('changlang'),
          
        ),
        ElevatedButton(
          onPressed: ()  { 
       emailcntoraler.text.isNotEmpty && passcntoraler.text.isNotEmpty
            ? dologin(emailcntoraler.text,passcntoraler.text)
          : Fluttertoast.showToast(msg: 'all field are required ',textColor: Color.fromARGB(255, 244, 54, 203));
      
          }, child: Text('login'),
          
        ),
            
              socialogin(),
            /// 
            ],
          ),
          

          
        ),
      ),
    ),

  
    bottomNavigationBar: Container(
      height: 50,
      color: globalcolors.maincolor,
      alignment: Alignment.center,
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('dont have an account?'),
        InkWell(
          child: Text(' Sign Up',
          style: TextStyle(
color: globalcolors.besiccolor,

          ),
          ),
        )
      ],

      ),
    ),
  );
  }
  
    dologin(String name, String pass)async {
    var res= await userlogin(name.trim(), pass.trim());
    
    // if(res){
      Route route=MaterialPageRoute(builder: (_)=>init());
      navigator?.pushReplacement(route);
    // }
    // else{
    //   Fluttertoast.showToast(msg: 'Email and paswored not valied',textColor: Colors.blueAccent);
    // }
    //print("dologin");
   //print(res.toString());
  }


}