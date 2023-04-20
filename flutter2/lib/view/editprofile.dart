
import 'dart:convert';
import 'package:flutter2/view/profile.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/login.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../components/applocal.dart';
import '../utils/Sharedsession.dart';


  late String emailjaw="";
rest_api fetch1=new rest_api();
String now = DateFormat("yyyy-MM-dd").format(DateTime.now());  

  var jsonString;
const List<String> list = <String>['Nablus', 'TulKarm', 'Jenen'];

 class editprofile extends StatefulWidget{

  const editprofile({Key?key}):super(key: key);

  @override
  State<editprofile> createState() => _editprofileState();
 
}

class _editprofileState extends State<editprofile> {
  rest_api fetch=new rest_api();
  

   @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
    // do something
     getinfo();
 var jsonString;
    print("Build Completed"); 
  });
  }
   void getinfo() async {
final prefs = await SharedPreferences.getInstance();
  String A = prefs.get("emailemail").toString();
  emailjaw=A;
print(namejaw);
  }
  
    final TextEditingController emailcntoraler= TextEditingController();
  final TextEditingController passcntoraler= TextEditingController();
   final TextEditingController phonecntoraler= TextEditingController();
   late final TextEditingController placecntoraler= TextEditingController();
     final TextEditingController namecntoraler= TextEditingController();
     String dropdownValue = list.first;


  
@override
Widget build(BuildContext context){
  
  double width=MediaQuery.of(context).size.width;
  double height=MediaQuery.of(context).size.height;
 
 return  Scaffold(
        appBar: AppBar(
          elevation: 0,
           
           backgroundColor: globalcolors.maincolor,
           leading:
           IconButton(onPressed: ()=>  Navigator.pop(context),
           icon:new Icon( Icons.arrow_back_ios_new_outlined),
          
            color: globalcolors.textcolor, 
            ),
            toolbarTextStyle: TextStyle(color: globalcolors.textcolor,
            ),
          title:
              Text("${getLang(context, "editpro")}",
              
              style:  TextStyle(color: globalcolors.textcolor,
              fontSize: 30,),
              
              
              ),
            centerTitle: true,
       
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
                   
                     ],
                   ),
                  ),
                  
                     SizedBox(height: 20,),
                  Text(emailjaw,
                          style: TextStyle(fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: globalcolors.textcolor)
                          ,),
                   SizedBox(height: 20,),
                   
                 
                  
  textfiledformat(controller:namecntoraler,
                 text:"${getLang(context, "name")}",
            obscure: false,
            textInputType: TextInputType.text,
            icon: new Icon(Icons.person_outline_rounded),
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
            SizedBox(height: 20,),
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
                         if(  passcntoraler.text.isNotEmpty
                          && phonecntoraler.text.isNotEmpty&& namecntoraler.text.isNotEmpty)
                       {
                         doupdate(namecntoraler.text,passcntoraler.text,phonecntoraler.text,dropdownValue);
      }else{
Fluttertoast.showToast(msg: "${getLang(context, "somefiled")}",
          textColor: globalcolors.notetcolor);
      }
                  },   
                       
                      ),
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

  doupdate(String username,String userpass,String userphone, String place ) async {
 const uuid = Uuid();
 var idd=uuid.v4();

final prefs = await SharedPreferences.getInstance();
  String A = prefs.get("emailemail").toString();
var res=await fetch1.userupdate(username,userpass,userphone,place,A).then((res) {

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
print(res.toString());
  Navigator.pop(context);

}
   
});
  
  
  }
  
}
