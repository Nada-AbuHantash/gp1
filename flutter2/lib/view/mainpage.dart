
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/widgets/button.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

 class mainbage extends StatefulWidget {
   const mainbage({super.key});
 
   @override
   State<mainbage> createState() => _mainbageState();
 }
 
 class _mainbageState extends State<mainbage> {
  int currentPageIndex = 2;
  List<String> foodList = [
    'Orange',
    'Berries',
    'Lemons',
    'Apples',
    'Mangoes',
    'Dates',
    'Avocados',
    'Black Beans',];
    List<String>? foodListSearch;
  final FocusNode _textFocusNode = FocusNode();
   final TextEditingController searchcntoraler= TextEditingController();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      
      backgroundColor: globalcolors.besiccolor,
      bottomNavigationBar: Container(
        color: globalcolors.besiccolor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
          child: GNav(
           
       
          //CurvedNavigationBar(
            backgroundColor: globalcolors.besiccolor,
            color: globalcolors.textcolor,
            activeColor: globalcolors.notetcolor,
            tabBackgroundColor: Color.fromARGB(200,197, 237, 228),
            //animationDuration:const Duration(milliseconds: 300),
            gap:8,
            onTabChange: (Index){
              setState(() {
                currentPageIndex = Index;
              });
              print(Index);
            } ,
            selectedIndex: currentPageIndex,
            
            // onTap: (index){
            //   print(index);
            // },
            //items:
            padding: const EdgeInsets.all(10),
            tabs: const [GButton(icon: Icons.person_outline_rounded,
            text: 'porile',),
              GButton(icon: Icons.bubble_chart_rounded,
            text: 'chat',),
            GButton(icon: Icons.home_outlined,
            text: 'home',),
            GButton(icon: Icons.shopping_cart_rounded,
            text: 'cart',),
            GButton(icon: Icons.favorite_border,
            text: 'notifivation',),
            
          // [Icon(Icons.home,
          // color: globalcolors.textcolor,
          // ),
          //    Icon(Icons.h_mobiledata,
          // color: globalcolors.textcolor,
          // ),
          //      Icon(Icons.home,
          // color: globalcolors.notetcolor,
          // ), Icon(Icons.home,
          // color: globalcolors.maincolor,
          // ),
          
          ]
          ),
          
        ),
        
      ),
      body: <Widget>[ 
        Container(
          alignment: Alignment.center,
          child: const Text('Page 1'),),
          Container(
          alignment: Alignment.center,
          
          
        ),
          Container(
         
          alignment: Alignment.center,
          // child: Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Column(
          //         children: [
          //           Row(
          //             children: [
                        child: AppBar(
                          backgroundColor: globalcolors.besiccolor,
                        title: 
                         Container(
                          height:55,
                          width: 350,
                        
                          padding: const EdgeInsets.only(top: 3, left: 25,right: 25),
                          decoration:
                               BoxDecoration(
                              color: globalcolors.besiccolor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 20,
                        )
                              ]
                            ),
                           child: TextField(
                             style: TextStyle(color:globalcolors.textcolor), 
                            controller:searchcntoraler,
                           decoration: InputDecoration(
                               iconColor: globalcolors.textcolor,
               
                            hintText: 'Search here',
                            icon: new Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            
                            hintStyle: TextStyle(
                              height: 1,
                              color: globalcolors.textcolor,
                            )
                            

                            ),
                            onChanged: (value) {
                              setState(() {
                    foodListSearch = foodList
                        .where(
                            (element) => element.contains(value.toLowerCase()))
                        .toList();
                    if (searchcntoraler.text.isNotEmpty &&
                        foodListSearch!.length == 0) {
                      print('foodListSearch length ${foodListSearch!.length}');
                    }
                  });
                            },
                         ),
                        
                         ),
                         
                              ),
                    //   ],
                    // ),
            //         Row(
            //            children:<Widget> [
            //           searchcntoraler.text.isNotEmpty &&
            //     foodListSearch!.length == 0
            // ? Center(
            //     child: Padding(
            //       padding: const EdgeInsets.all(18.0),
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Icon(
            //               Icons.search_off,
            //               size: 160,
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Text(
            //               'No results found,\nPlease try different keyword',
            //               style: TextStyle(
            //                   fontSize: 30, fontWeight: FontWeight.w600),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   )
                       
            //            :ListView.builder(
            //              itemCount: searchcntoraler.text.isNotEmpty?
            //                 foodListSearch!.length
            //                 :foodList.length,
            //              itemBuilder: (BuildContext context, int index) {
            //                return Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Row(
            //               children: [
            //                 CircleAvatar(
            //                   child: Icon(Icons.food_bank),
            //                 ),
            //                 SizedBox(
            //                   width: 10,
            //                   height: 45,
            //                 ),
            //                 Text(searchcntoraler.text.isNotEmpty
            //                     ? foodListSearch![index]
            //                     : foodList[index]),
            //               ],
            //             ),
                        
            //           );
            //              },
            //            ),
                   
            //            ]
            //               ),
          //         ],
          //       ),
                      
          //     ),
          //   ],
          // ),
         
        ),
        Container(
          
          alignment: Alignment.center,
          child: const Text('Page 4'),
        ),
        Container(
          
          alignment: Alignment.center,
          child: const Text('Page 4'),
        ),
         
      ][currentPageIndex],  
      );
 
   }
   
     
 }