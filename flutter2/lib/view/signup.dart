
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/login.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter2/view/seller.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../components/applocal.dart';
import 'dil.dart';
import 'init.dart';
rest_api fetch=new rest_api();
const List<String> list = <String>['Nablus', 'TulKarm', 'Jenen'];

 class signup extends StatefulWidget{

  const signup({Key?key}):super(key: key);

  @override
  State<signup> createState() => _signupState();
}
  final _auth = FirebaseAuth.instance;
class _signupState extends State<signup> {
    final TextEditingController emailcntoraler= TextEditingController();
  final TextEditingController passcntoraler= TextEditingController();
   final TextEditingController phonecntoraler= TextEditingController();
     final TextEditingController namecntoraler= TextEditingController();
      final TextEditingController moneycntoraler= TextEditingController();
      String dropdownValue = list.first;
       
@override
Widget build(BuildContext context){
  
  double width=MediaQuery.of(context).size.width;
  double height=MediaQuery.of(context).size.height;
 
 return  Scaffold(
        
        body: 
         
              Container(
                color: globalcolors.besiccolor,
                width: width,
                height: height,
                child: SingleChildScrollView(
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height*0.25,
                width: width*0.50,
                child: Image.asset('assets/images/logoo1.png',fit: BoxFit.fill,),
               
              ),
              const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                    Text("${getLang(context, "SIGNUP")}\n",
                      style: TextStyle(fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                       color: globalcolors.maincolor)
                      ,)
                    ],
                  ),
                Text("${getLang(context, "signdis")}",
                      style: TextStyle(fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: globalcolors.textcolor)
                      ,),
                    const SizedBox(height: 10),


                 textfiledformat(controller:namecntoraler,
                 text:"${getLang(context, "name")}",
            obscure: false,
            textInputType: TextInputType.text,
            icon: new Icon(Icons.person_outline_rounded),
            ),
                 const SizedBox(height: 20),


                 textfiledformat(controller:emailcntoraler,
                 
                 text:"${getLang(context, "Email")}",
            obscure: false,
            textInputType: TextInputType.emailAddress,
            icon: new Icon(Icons.alternate_email),
            ),
            const SizedBox(height: 20),


              textfiledformat(controller:passcntoraler,
             text:"${getLang(context, "password")}",
            obscure: true,
            textInputType: TextInputType.text,
            icon: new Icon(Icons.password),
            ),
            const SizedBox(height: 20),


                 textfiledformat(controller:phonecntoraler,
                 text:"${getLang(context, "phone")}",
            obscure: false,
            textInputType: TextInputType.phone,
            icon: new Icon(Icons.phone_iphone_rounded),
            ),
            const SizedBox(height: 20),
           

            Container(height:55,
                        width: 350,
              padding: const EdgeInsets.only(top: 3, left: 25,right: 25),
              decoration: BoxDecoration(
        
              color: globalcolors.besiccolor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 20,
                  
                          )
                       ]
                   ),
                   
              child: DropdownButtonFormField<String>(
                 decoration: InputDecoration(
         prefixIcon: Icon(Icons.place_outlined,color: globalcolors.textcolor,),

         ),
                  value: dropdownValue,
                  elevation: 40,
                  style:  TextStyle(color: globalcolors.notetcolor),
                  onChanged: (String? value) {
                    BoxDecoration(
                      
                      color: globalcolors.besiccolor);

                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                  
                    return DropdownMenuItem<String>(
                      value: value, 
                      child: Text(value,style: TextStyle(
                         color: globalcolors.textcolor,fontSize: 15),),
                    );
                  }).toList(),
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
                       backgroundColor: globalcolors.notetcolor,
                       minimumSize: Size(250, 50), 
                    ),
                    child: 
                    Text("${getLang(context, "Signup")}",
              style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
              ),
                      onPressed: () async { 

                      if( emailcntoraler.text.isNotEmpty && passcntoraler.text.isNotEmpty
                          && phonecntoraler.text.isNotEmpty&& namecntoraler.text.isNotEmpty)
                       {
                     
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: emailcntoraler.text, password: passcntoraler.text);
                        print(newUser);
                  } catch (e) {
                    print(e);
                  }
                
         
                            showDialog(
          context: context,
          builder: (BuildContext context) =>
          AlertDialog(
            title: Text("${getLang(context, "singass")}"),
            titleTextStyle: TextStyle(color: globalcolors.notetcolor,fontSize: 20),
            backgroundColor: globalcolors.besiccolor,
            
            actions: [
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
                       minimumSize: Size(250, 50), 
                    ),
                    child: Text("${getLang(context, "ascustomer")}",
                    
              style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
              ),
                      onPressed: ()  { 
                        int flag=0;
                    
                     dosignup(flag,namecntoraler.text,emailcntoraler.text,passcntoraler.text,phonecntoraler.text,dropdownValue);
      
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
                       backgroundColor: globalcolors.textcolor,
                       minimumSize: const Size(250, 50), 
                    ),
                    child: Text("${getLang(context, "asseller")}",
              style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
              ),
                      onPressed: ()  { 
                        int flag=1;
                           dosignup(flag,namecntoraler.text,emailcntoraler.text,passcntoraler.text,phonecntoraler.text,dropdownValue);

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
                       backgroundColor: globalcolors.textcolor,
                       minimumSize: const Size(250, 50), 
                    ),
                    child:  Text("${getLang(context, "asdeliry")}",
              style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
              ),
                      onPressed: ()  { 
                        
       int flag=2;
                           dosignup(flag,namecntoraler.text,emailcntoraler.text,passcntoraler.text,phonecntoraler.text,dropdownValue);

              },   
                    ),
              ),
              
                 
                ],
            
              ),
            ),
             const SizedBox(height: 20),
            ],
           
          )
          
        );
         
                       }
                       else{Fluttertoast.showToast(msg: "${getLang(context, "somefiled")}",
          textColor: globalcolors.notetcolor);
          }
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
        );
}

  dosignup(int f,String username,String useremail,String userpass,String userphone, dropdownValue) async {

 String userpalce=dropdownValue;
 print(userpalce);
if(f==0){
var res=await fetch.usersignup(username, useremail,userpass,userphone,userpalce).then((res) {

if(res==null){  print("Duplication");
AlertDialog alert = const AlertDialog(
         content: Text("this email is used before it\n هذا البريد مستخدم من قبل "),
        
        );
        
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
}else{
print(res.toString());
Route route=MaterialPageRoute(builder: (_)=>login());
      navigator?.pushReplacement(route);

}
   
});

}
else if(f==1){

var res=await fetch.sellersignup(username, useremail,userpass,userphone,userpalce).then((res) {

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
Route route=MaterialPageRoute(builder: (_)=>seller());
      navigator?.pushReplacement(route);

}
   
});

}else if (f==2){

  var res=await fetch.deliverysignup(username, useremail,userpass,userphone,userpalce).then((res) {

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
Route route=MaterialPageRoute(builder: (_)=>dil());
      navigator?.pushReplacement(route);

}
   
});
}
  }//do signup
  
   
}
