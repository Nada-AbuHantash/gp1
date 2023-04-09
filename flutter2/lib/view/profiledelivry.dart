
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/editprofile.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/login.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../components/applocal.dart';
import 'package:shared_preferences/shared_preferences.dart';
 late String namejaw="";
late String passjaw="";
late String emailjaw="";
late String placejaw="";
late String phonejaw="";
late String cardjaw="";
late String superjaw="";
rest_api fetch1=new rest_api();


  var jsonString;
  // var json;
const List<String> list = <String>['Nablus', 'TulKarm', 'Jenen'];

 class profileseller extends StatefulWidget{

  const profileseller({Key?key}):super(key: key);

  @override
  State<profileseller> createState() => _profilesellerState();
}

class _profilesellerState extends State<profileseller> {
  
  @override
  void initState() {
    
  int h=1;
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
    // do something
     getinfo();
 var jsonString;
    print("Build Completed"); 
  });
  }
   void getinfo() async {
jsonString=await fetch1.getinfo3();
// json=await fetch1.getinfo2();
final prefs = await SharedPreferences.getInstance();
String email= prefs.get("emailemail").toString();
if(jsonString !=null){
namejaw=jsonString.elementAt(0)['deliveryname'];
passjaw=jsonString.elementAt(0)['deliverypass'];
emailjaw=jsonString.elementAt(0)['deliveryemail'];
placejaw=jsonString.elementAt(0)['deliveryplace'];
phonejaw=jsonString.elementAt(0)['deliveryphone'].toString();
cardjaw=jsonString.elementAt(0)['deliverycard'].toString();

print(namejaw);}
// else {
// namejaw=json.elementAt(0)['sellername'];
// passjaw=json.elementAt(0)['sellerpass'];
// emailjaw=json.elementAt(0)['selleremail'];
// placejaw=json.elementAt(0)['sellerplace'];
// phonejaw=json.elementAt(0)['sellerphone'].toString();
// }
  }
 
       
@override
Widget build(BuildContext context){
  
  double width=MediaQuery.of(context).size.width;
  double height=MediaQuery.of(context).size.height;
 
 return  Scaffold(
        appBar: AppBar(
          elevation: 0,
           centerTitle: true,
           backgroundColor: globalcolors.maincolor,
           leading:
           IconButton(onPressed: ()=> Get.back(), 
           icon:new Icon( Icons.arrow_back_ios_new_outlined),
          
            color: globalcolors.textcolor, 
            ),
            toolbarTextStyle: TextStyle(color: globalcolors.textcolor,
            ),
          title: 
              Text("${getLang(context, "pro")}",
              
              style:  TextStyle(color: globalcolors.textcolor,
              fontSize: 30,),
              
              
              ),
           
        ),
        body: 
         SingleChildScrollView(
             child: Column(
               children: [
                 Container(
                  padding: const EdgeInsets.only(right: 35,left: 35),
                    color: globalcolors.maincolor,
                    width: width,
                    height: height,
                    child: SingleChildScrollView(
                        child: Column(
                         // mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Container(
                   child:
                    Stack(
                     children: [
                       SizedBox(
                        height: 120,
                        width: 120,
                        child:ClipRRect( borderRadius:BorderRadius.circular(100),
                        child:
                        Image.asset('assets/images/profile1.png',fit: BoxFit.fill,),)
                        ),
                      Positioned(
                        bottom: 0,right: 0,
                           child: Container(
                             
                            width: 40,
                             
                            height: 40,
                             
                            decoration: BoxDecoration(
                            
                              borderRadius: BorderRadius.circular(100),
                             
                              color: globalcolors.notetcolor.withOpacity(0.3),
                             
                            ),
                             
                            child:  Icon(Icons.mode_edit_outlined,color: globalcolors.notetcolor,),
                             
                           ),
                         ) 
                     ],
                   ),
                  ),
                   SizedBox(height: 10,),
                  Text(namejaw,
                            style: TextStyle(fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                             color: globalcolors.textcolor)
                            ,),
                           
                  Text(emailjaw,
                          style: TextStyle(fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: globalcolors.textcolor)
                          ,),
                  
                  const SizedBox(height: 20),
                   SizedBox(
                       
                        
                      child: ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          
                           shape: RoundedRectangleBorder(
                            
                      borderRadius: BorderRadius.circular(20.0)),
                          foregroundColor: globalcolors.maincolor,
                           backgroundColor: globalcolors.notetcolor,
                           minimumSize: Size(250, 50), 
                        ),
                        child: 
                        Text("${getLang(context, "editpro")}",
                  style: TextStyle(color: globalcolors.maincolor,fontSize: 20),
                  ),
                          onPressed: ()  { 
                            Route route=MaterialPageRoute(builder: (_)=>editprofile());
                               navigator?.pushReplacement(route);
                          // print(dropdownValue);
                      //   doupdate(namecntoraler.text,emailcntoraler.text,passcntoraler.text,phonecntoraler.text,placecntoraler.text);
      
                  },   
                       
                      ),
                      ),
                       const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
profilemenuwidget(
  title:emailjaw ,
  icon: Icons.alternate_email,
  encode: false,
  onPressed: (){},
),
profilemenuwidget(
  title:namejaw ,
  icon: Icons.account_circle_outlined,
  encode: true,
  onPressed: (){},
),
          profilemenuwidget(
  title:passjaw ,
  icon: Icons.password,
  encode: true,
  onPressed: (){},
),          
                       profilemenuwidget(
  title:phonejaw ,
  icon: Icons.phone_iphone_rounded,
  encode: true,
  onPressed: (){},
),
                     
           profilemenuwidget(
  title:placejaw ,
  icon: Icons.place_outlined,
  encode: true,
  onPressed: (){},
),
           profilemenuwidget(
  title:superjaw ,
  icon: Icons.maps_home_work_outlined,
  encode: true,
  onPressed: (){},
),

   profilemenuwidget(
  title:cardjaw ,
  icon: Icons.money_rounded,
  encode: true,
  onPressed: (){},
),
            ],      
         ),
                   
                    ),
                  ),
               ],
             ),
         ),
        );
}


  
}

class profilemenuwidget extends StatelessWidget {
  const profilemenuwidget({
    Key?key,
    required this.title,
    required this.icon,
    required this.onPressed,
     this.encode=true,
  }):super(key:key);
final String title;
final IconData icon;
final VoidCallback onPressed;
final bool encode;
  @override
  Widget build(BuildContext context) {
    return     ListTile(
    onTap: onPressed,
                         leading: Container(
    
                          width: 40,
    
                          height: 40,
    
                          decoration: BoxDecoration(
    
                            borderRadius: BorderRadius.circular(100),
    
                            color: globalcolors.besiccolor.withOpacity(0.3),
    
                          ),
    
                          child:  Icon(icon,color: globalcolors.besiccolor,),
    
                         ),
    
                         title: Text(title,
    
                                style: TextStyle(fontSize: 15.0,
    
                                fontWeight: FontWeight.bold,
    
                                 color: globalcolors.textcolor)
    
                                ,),
    
                       
    
    
                          );
  }
}
