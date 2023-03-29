import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter2/view/signup.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../components/applocal.dart';
import 'package:flutter2/view/mainpage.dart';
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
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
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
              Text(
                "${getLang(context, "dislogin")}",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: globalcolors.textcolor),
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
                        onPressed: () {
                          emailcntoraler.text.isNotEmpty &&
                                  passcntoraler.text.isNotEmpty
                              ? dologin(emailcntoraler.text, passcntoraler.text)
                              : Fluttertoast.showToast(
                                  msg: "${getLang(context, "somefiled")}",
                                  textColor: Color.fromARGB(255, 244, 54, 203));
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
      // try {
    var res = await fetch.userlogin(email.trim(), pass.trim());

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
                                MaterialPageRoute(builder: (_) => home()));
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

        return const home();
      } else {
        print("failed1");
        AlertDialog alert = const AlertDialog(
         content: Text("please try again"),
        );
        // show the dialog
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
      }
    // } catch (e) {
    //   print("no login");
    // }

   
  
}
