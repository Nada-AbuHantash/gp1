import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'about/about.dart';


class dil extends StatefulWidget {
  const dil({super.key});


  @override
  State<dil> createState() => _dilState();
}

class _dilState extends State<dil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalcolors.maincolor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: 
            <Widget>[
              const Text(
                '\n\nDear driver,\n'
                'welcome to the SALE app , In this application, you will use your car or bike to deliver orders from stores to customers in your area. You can get money quickly and take advantage of your free time. If you are a professional driver with a clean record of accidents and problems, and you want to participate with us in this application, just complete the necessary procedures to get an account. and we will contact you soon through our administrator',
                style: TextStyle(
                    color:Color(0xFF0E4473),
                    fontWeight:  FontWeight.bold, fontSize: 20, height: 1.5),
              ),
              SizedBox(height: 70),
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
                      foregroundColor: globalcolors.textcolor,
                       backgroundColor: globalcolors.besiccolor,
                       minimumSize: const Size(250, 50), 
                    ),
                    child: Text("I a gree",
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
            //   TextButton(onPressed: ()=>null, child: Text("I agree "),
            //   style: ButtonStyle(
            //     foregroundColor: MaterialStateProperty.all(globalcolors.textcolor),
            //     backgroundColor: MaterialStateProperty.all(globalcolors.besiccolor),

            //   ),),
  // Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 SizedBox(
  //                 child: ElevatedButton(
                    
  //                   style: ElevatedButton.styleFrom(
                      
  //                      shape: RoundedRectangleBorder(
                        
  //                 borderRadius: BorderRadius.circular(20.0)),
  //                     foregroundColor: globalcolors.maincolor,
  //                      backgroundColor: globalcolors.textcolor,
  //                      minimumSize: const Size(250, 50), 
  //                   ),
  //                   child: Text(
  //               '\nDear driver,\n'
  //               'welcome to the SALE app , In this application, you will use your car or bike to deliver orders from stores to customers in your area. You can get money quickly and take advantage of your free time. If you are a professional driver with a clean record of accidents and problems, and you want to participate with us in this application, just complete the necessary procedures to get an account. and we will contact you soon through our administrator',
                
  //             style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
  //             ),
  //                     onPressed: ()  { 
  //                          navigator?.push(MaterialPageRoute(builder: (_)=>AboutScreen()));
      
  //             },   
  //                   ),
  //             ),
              
                 
  //               ],
            
  //             ),
  //           ),
            ],
          ),
        ),
      ),


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
