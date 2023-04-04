
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/login.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../components/applocal.dart';

 late String namejaw="";
late String passjaw="";
late String emailjaw="";
late String placejaw="";
late String phonejaw="";
rest_api fetch1=new rest_api();


  var jsonString;
const List<String> list = <String>['Nablus', 'TolKarm', 'Jenen'];

 class editprofail extends StatefulWidget{

  const editprofail({Key?key}):super(key: key);

  @override
  State<editprofail> createState() => _editprofailState();
}

class _editprofailState extends State<editprofail> {
  
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
jsonString=await fetch1.getinfo1();
namejaw=jsonString.elementAt(0)['username'];
passjaw=jsonString.elementAt(0)['userpass'];
emailjaw=jsonString.elementAt(0)['useremail'];
placejaw=jsonString.elementAt(0)['userplace'];
phonejaw=jsonString.elementAt(0)['userphone'].toString();
print(namejaw);
  }
    final TextEditingController emailcntoraler= TextEditingController();
  final TextEditingController passcntoraler= TextEditingController();
   final TextEditingController phonecntoraler= TextEditingController();
   late final TextEditingController placecntoraler= TextEditingController();
     final TextEditingController namecntoraler= TextEditingController();
     // String dropdownValue = placejaw;
       
@override
Widget build(BuildContext context){
  
  double width=MediaQuery.of(context).size.width;
  double height=MediaQuery.of(context).size.height;
 
 return  Scaffold(
        appBar: AppBar(
          elevation: 0,
           backgroundColor: globalcolors.maincolor,
          title: Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Profile",
              
              style:  TextStyle(color: globalcolors.textcolor,
              fontSize: 30,),
              
              
              ),
            ],
          ),
        ),
        body: 
         SingleChildScrollView(
             child: Container(
                color: globalcolors.maincolor,
                width: width,
                height: height,
                child: SingleChildScrollView(
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
               child: SizedBox(
                height: 120,
                width: 120,
                child:ClipRRect( borderRadius:BorderRadius.circular(100),
                child:
                Image.asset('assets/images/logoo1.png',fit: BoxFit.fill,),)
                ),
              ),
              const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                    Text("profile",
                      style: TextStyle(fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                       color: globalcolors.maincolor)
                      ,)
                    ],
                  ),
                Text("${getLang(context, "profiledis")}",
                      style: TextStyle(fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: globalcolors.textcolor)
                      ,),
                    const SizedBox(height: 10),


                 textfiledformat(controller:namecntoraler,
                 text:namejaw,
            obscure: false,
            textInputType: TextInputType.text,
            icon: new Icon(Icons.person_outline_rounded),
            ),
                 const SizedBox(height: 20),


                 textfiledformat(controller:emailcntoraler,
                 
                 text:emailjaw,
            obscure: false,
            textInputType: TextInputType.emailAddress,
            icon: new Icon(Icons.alternate_email),
            ),
            const SizedBox(height: 20),


              textfiledformat(controller:passcntoraler,
             text:passjaw,
            obscure: true,
            textInputType: TextInputType.text,
            icon: new Icon(Icons.password),
            ),
            const SizedBox(height: 20),


                 textfiledformat(controller:phonecntoraler,
                 text:phonejaw,
            obscure: false,
            textInputType: TextInputType.phone,
            icon: new Icon(Icons.phone_iphone_rounded),
            ),
            const SizedBox(height: 20),
           
textfiledformat(controller:placecntoraler,
                 text:placejaw,
            obscure: false,
            textInputType: TextInputType.text,
            icon: new Icon(Icons.place_outlined),
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
                       minimumSize: Size(250, 50), 
                    ),
                    child: 
                    Text("Update",
              style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
              ),
                      onPressed: ()  { 
                      // print(dropdownValue);
                     doupdate(namecntoraler.text,emailcntoraler.text,passcntoraler.text,phonecntoraler.text,placecntoraler.text);
      
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
        );
}

  doupdate(String username,String useremail,String userpass,String userphone, String place) async {
 const uuid = Uuid();
 var idd=uuid.v4();

final prefs = await SharedPreferences.getInstance();
  String A = prefs.get("emailemail").toString();
var res=await fetch1.userupdate(username, useremail,userpass,userphone,place,A).then((res) {

if(res==null){  print("Duplication");
AlertDialog alert = const AlertDialog(
         content: Text("this email is used before it "),
        );
        
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
}
else{
print(res.toString());
Route route=MaterialPageRoute(builder: (_)=>login());
      navigator?.pushReplacement(route);

}
   
});
  
  
  }
  
}
