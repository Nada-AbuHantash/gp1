import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/profile.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/homecust.dart';
import 'package:flutter2/view/selhom.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter2/view/signup.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../components/applocal.dart';
import 'package:flutter2/view/mainpage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../main.dart';
import '../utils/Sharedsession.dart';
import 'addproduct.dart';
rest_api fetch=new rest_api();
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final TextEditingController emailcntoraler = TextEditingController();
  final TextEditingController passcntoraler = TextEditingController();
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
  // @override
  // void initState() {
  //   super.initState();

  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification != null && android != null) {
  //       flutterLocalNotificationsPlugin.show(
  //           notification.hashCode,
  //           notification.title,
  //           notification.body,
  //           NotificationDetails(
  //             android: AndroidNotificationDetails(
  //               channel.id,
  //               channel.name,
  //               color: Colors.pink,
  //               playSound: true,
  //               icon: '@mipmap/ic_launcher',
  //             ),
  //           ));
  //     }
  //   });
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print('A new onMessageOpenedApp event was published!');
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification != null && android != null) {
  //       showDialog(
  //           context: context,
  //           builder: (_) {
  //             return AlertDialog(
  //               title: Text("${notification.title}"),
  //               content: SingleChildScrollView(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [Text("${notification.body}")],
  //                 ),
  //               ),
  //             );
  //           });
  //     }
  //   });
  //       flutterLocalNotificationsPlugin.show(
  //       0,
  //       "Imprtant Meassge!",
  //       "Your teacher canceled your appointment",
  //       NotificationDetails(
  //           android: AndroidNotificationDetails(channel.id, channel.name,
  //               importance: Importance.high,
  //               color: Colors.blue,
  //               playSound: true,
  //               icon: '@mipmap/ic_launcher')));
  // }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          color: globalcolors.besiccolor,
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Container(
                  height: height * 0.25,
                  width: width * 0.50,
                  child: Image.asset(
                    'assets/images/logoo1.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${getLang(context, "LOGIN")}\n",
                      style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: globalcolors.maincolor),
                    )
                  ],
                ),
      
                const SizedBox(height: 40),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                     Flexible(
                   child: Column(
                      children:<Widget> [
                        
                    Container( child:
                        textfiledformat(
                          controller: emailcntoraler,
                          text: "${getLang(context, "Email")}",
                          obscure: false,
                          textInputType: TextInputType.emailAddress,
                         icon: new Icon(Icons.email_outlined),
                        ),
                    )
                      ],
                      
                    ),
                     ),
                  ],
                ),
                const SizedBox(height: 30),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                     Flexible(
                   child: Column(
                      children:<Widget> [
                        
                    Container( child:
                       textfiledformat(
                      controller: passcntoraler,
                      text: "${getLang(context, "password")}",
                      obscure: true,
                      textInputType: TextInputType.text,
                      icon: new Icon(Icons.password),
      
                    ),
                    )
                      ],
                      
                    ),
                     ),
                     
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            foregroundColor: globalcolors.maincolor,
                         backgroundColor: globalcolors.notetcolor,
                            minimumSize: Size(250, 50),
                          ),
                          child: Text(
                            "${getLang(context, "login")}",
                            style: TextStyle(
                                color: globalcolors.maincolor, fontSize: 25),
                          ),
                          onPressed: ()async {
                      setState(() {
                      showSpinner = true;
                    });
                    try {
                      
                      final user = await _auth.signInWithEmailAndPassword(
                          email: emailcntoraler.text, password: passcntoraler.text,);
                      if (user != null) {
                        
                      
                      }
                    } catch (e) {
                      print(e);
                    }
                  
                            emailcntoraler.text.isNotEmpty &&
                                    passcntoraler.text.isNotEmpty
                                ? dologin(emailcntoraler.text, passcntoraler.text)
                                : Fluttertoast.showToast(
                                    msg: "${getLang(context, "somefiled")}",
                                    textColor: Color.fromARGB(255, 244, 54, 203));
                                     setState(() {
                              showSpinner = false;
                            });
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
      bottomNavigationBar: Container(
        height: 80,
        color: globalcolors.besiccolor,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${getLang(context, "donthaveaccount")}",
              style: TextStyle(color: globalcolors.textcolor),
            ),
            InkWell(
              onTap: () => {
                navigator?.pushReplacement(
                    MaterialPageRoute(builder: (_) => signup()))
              },
              ////child: Text(' Sign Up',
              child: Text(
                "${getLang(context, "Signup")}",
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

  dologin(String email, String pass) async {
   
   var res = await fetch.userlogin(email.trim(), pass.trim());
var res1=await fetch.deliverylogin(email.trim(), pass.trim());
var res2=await fetch.sellerlogin(email.trim(), pass.trim());
      print("dologin");
 if (res.body.contains("@")) {
      var jsonString = json.decode(res.body)as List;
    
      String  emailc=jsonString.elementAt(0)['useremail'];
      
 if (emailc!='' && pass!='') {
      setState(() {
                          showSpinner = true;
                        });
                        fetch.userlogin(emailc.replaceAll(' ', ''), pass)
                            .then((user) {
                               print(emailc);
                          if (user != null) {
                            print("Login Sucessfull");
                            setState(() {
                              showSpinner = false;
                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => MyHomePage1()));
                          } else {
                            
                            print("Login Failed");
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        });
                      } else {
                        print("Please fill form correctly");
                      }
                     // Navigator.of(context).push(MaterialPageRoute(builder: (c) => home()));

      
      }
       else if (res1.body.contains("@")) {
      var jsonString = json.decode(res1.body)as List;
    
      String  emailc=jsonString.elementAt(0)['deliveryemail'];
      int flag=jsonString.elementAt(0)['flag_req'];
 if (emailc!='' && pass!='' && flag ==0 ) {
      setState(() {
                          showSpinner = true;
                        });
                        fetch.deliverylogin(emailc.replaceAll(' ', ''), pass)
                            .then((user) {
                               print(emailc);
                          if (user != null) {
                            print("Login Sucessfull");
                            setState(() {
                              showSpinner = false;
                            });
                              setState(() {
                        showSpinner = false;
                      });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => home()));
              
                          } else {
                            
                            print("Login Failed");
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        });
                      } else {
                        AlertDialog alert = const AlertDialog(
         content: Text("You can't log in ,Verify that the administrator has approved your request through your email.\n"
             "لا يمكنك تسجيل الدخول ، تحقق من موافقة المسؤول على طلبك من خلال بريدك الإلكتروني ."),
        );
                      }
                     // Navigator.of(context).push(MaterialPageRoute(builder: (c) => home()));

      
      } 
    else if (res2.body.contains("@")) {
      
      var jsonString = json.decode(res2.body)as List;
  
      String  emailc=jsonString.elementAt(0)['selleremail'];  
      int flag1=jsonString.elementAt(0)['flag_req'];
     
 if (emailc!='' && pass!='' && flag1==0) {
      setState(() {
                          showSpinner = true;
                        });
                        fetch.sellerlogin(emailc.replaceAll(' ', ''), pass)
                            .then((user) async {
                               print(emailc);
                          if (user != null) {
                              String  supermarket=jsonString.elementAt(0)['suparmarketname']; 
                              Sharedsession shared = new Sharedsession();
                               
                             await shared.savenamesuper(supermarket); 
                             print(supermarket);
                            print("Login Sucessfull");
                            setState(() {
                              showSpinner = false;
                            });
                              setState(() {
                        showSpinner = false;
                      });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => selhom()));
                          } else {
                            
                            print("Login Failed");
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        });
                      } else {
                        print("Please fill form correctly & You do not have the authority ");
                        
                      }
                     // Navigator.of(context).push(MaterialPageRoute(builder: (c) => home()));

      
      }
      else{
        print("failed1");
          setState(() {
                              showSpinner = false;
                            });
                             
                              setState(() {
                        showSpinner = false;
                      });
        AlertDialog alert = const AlertDialog(
         content: Text("please try again , email must include @\nYou can't log in ,Verify that the administrator has approved your request through your email.\n"
             "الرجاء اعادة المحاولة ، يجب أن يحتوي البريد الالكتروني على @ "
             "او لا يمكنك تسجيل الدخول ، تحقق من موافقة المسؤول على طلبك من خلال بريدك الإلكتروني ."),
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
      }
    

   
  
}
