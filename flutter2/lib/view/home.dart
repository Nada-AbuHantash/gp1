
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/signup.dart';
import 'package:get/get.dart';
import '../components/applocal.dart';
import 'login.dart';
import 'package:flutter2/view/about/about.dart';



 class home extends StatefulWidget{

  const home({Key?key}):super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
    final TextEditingController emailcntoraler= TextEditingController();
  final TextEditingController passcntoraler= TextEditingController();
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
                     
            children: [
              Container(
                height: height*0.45,
                width: width*0.95,
                child: Image.asset('assets/images/logo1.png',fit: BoxFit.fill,),
               
              ),
              const SizedBox(height: 30),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${getLang(context,"home")}",
                      style: TextStyle(fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                       color: globalcolors.textcolor)
                      ,)
                    ],
                  ),
               
                
            const SizedBox(height: 80),
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
                    child: Text("${getLang(context, "About")}",
              style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
              ),
                      onPressed: ()  { 
                           navigator?.push(MaterialPageRoute(builder: (_)=>AboutScreen()));
      
              },   
                    ),
              ),
              
                 
                ],
            
              ),
            ),
            const SizedBox(height:15),
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
                    child: Text("${getLang(context, "login")}",
              style: TextStyle(color: globalcolors.maincolor,fontSize: 27),
              ),
                      onPressed: ()  { 
                       
                      navigator?.push(MaterialPageRoute(builder: (_)=>login()));
      
              },   
                    ),
              ),
              
                 
                ],
            
              ),
            ),
             const SizedBox(height: 20),
             
            ],
         ),
                ),
                
              ),
             bottomNavigationBar: Container(
      height: 100,
      color: globalcolors.besiccolor,
      alignment: Alignment.center,
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Text("${getLang(context, "donthaveaccount")}",
        style: TextStyle(color: globalcolors.textcolor),),
        InkWell(
          onTap: () => {
             navigator?.pushReplacement(MaterialPageRoute(builder: (_)=>signup()))
          },
          
          child: Text("${getLang(context, "Signup")}",
          style: TextStyle(
color: globalcolors.notetcolor,

          ),
          ),
        )
      ],

      ),
    ),
        );
}

   
}
