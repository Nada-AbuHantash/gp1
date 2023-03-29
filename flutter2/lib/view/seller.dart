import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'about/about.dart';




class seller extends StatefulWidget {
    const seller({Key?key}):super(key: key);


  @override
  State<seller> createState() => _sellerState();
}

class _sellerState extends State<seller> {
    final TextEditingController niscntoraler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalcolors.maincolor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                 Text(
                  '\n\nDear seller,\n'
                      'welcome to the SALE app ,'
                      ' in this app we offers to you the fastest way to show and sell your product ,'
                      'by Adding the product, and then we take care of advertising '
                      'and delivering it to the largest number of customers in your area ,'
                      ' All this for a small price that you pay us for these services ,'
                      'It will be a small percentage of each product you add to your'
                      ' list and it is predetermined by us ,'
                      'If you agree to this You can complete the procedures and we '
                      'will contact you personally by our administrator in your store.'
                      '\n\nًًYou must set a budget to make it easier for us to deal with profits.',
                  style: TextStyle(
                      color:globalcolors.textcolor,
                      fontWeight:  FontWeight.bold, fontSize: 20, height: 1.5),
                ),
                SizedBox(width: 5,height: 20,),
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
                    obscure: true,
                    textInputType: TextInputType.text,
                    icon: new Icon(Icons.wallet),

                  ),
                  )
                    ],
                    
                  ),
                   ),
                   
                ],
              ),
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
              style: TextStyle(color: globalcolors.textcolor,fontSize: 25),
              ),
                      onPressed: ()  { 
                           navigator?.push(MaterialPageRoute(builder: (_)=>AboutScreen()));
      
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
}
