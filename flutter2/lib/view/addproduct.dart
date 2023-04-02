import 'dart:convert';
import 'dart:io';
import 'package:flutter2/view/editprofail.dart';
import 'package:image_picker/image_picker.dart';
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
import 'init.dart';
const List<String> list = <String>['لحوم طازجة', 'ألبان وبيض', 'معلبات','سكاكر وشكلاتة'];
class addproduct extends StatefulWidget{

  const addproduct({Key?key}):super(key: key);

  @override
  State<addproduct> createState() => _addproductState();
}
class _addproductState extends State<addproduct> {
  final TextEditingController namecntoraler= TextEditingController();
  final TextEditingController oldpricecntoraler= TextEditingController();
  final TextEditingController newpricecntoraler= TextEditingController();
  final TextEditingController countcntoraler= TextEditingController();
 late TextEditingController pathcntoraler= TextEditingController();
  late String pathimg="";
  

  String dropdownValue = list.first;
  File? pickedImage;
  bool isPicked = false;
  @override
  Widget build(BuildContext context){
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Container(
        color: globalcolors.besiccolor,
        width: width,
        height: height,
        child: SingleChildScrollView(
        child: Column(
            children: [
              const SizedBox(height: 40),
              Text("${getLang(context, "addproducts")}",
                style: TextStyle(fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: globalcolors.textcolor)
                ,),
              const SizedBox(height: 20),
              textfiledformat(controller:namecntoraler,
                text:"${getLang(context, "productname")}",
                obscure: false,
                textInputType: TextInputType.text,
                icon: const Icon(Icons.production_quantity_limits),
              ),
              const SizedBox(height: 20),
              textfiledformat(controller:oldpricecntoraler,

                text:"${getLang(context, "oldprice")}",
                obscure: false,
                textInputType: TextInputType.number,
                icon: const Icon(Icons.money_off),
              ),
              const SizedBox(height: 20),
              textfiledformat(controller:newpricecntoraler,

                text:"${getLang(context, "newprice")}",
                obscure: false,
                textInputType: TextInputType.number,
                icon: const Icon(Icons.attach_money),
              ),
              const SizedBox(height: 20),
              textfiledformat(controller:countcntoraler,

                text:"${getLang(context, "count")}",
                obscure: false,
                textInputType: TextInputType.number,
                icon: const Icon(Icons.numbers),
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
                    prefixIcon: Icon(Icons.fastfood,color: globalcolors.textcolor,),

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
                padding: const EdgeInsets.only(right: 25,left: 25),
                child: 
                 ListTile(
                 title: Row(
                  children: [
                    
                   
                      
                      Expanded(child:  Container(
                        height:55,
                  width: 250,
                
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
                    child: TextFormField(
                      style: TextStyle(color:globalcolors.textcolor), 
                      controller: pathcntoraler,
                      keyboardType:TextInputType.text ,
                      obscureText: false,
                  decoration: InputDecoration(
              iconColor: globalcolors.textcolor,
               
                    hintText:"${getLang(context, "nophoto")}", 
                    icon: const Icon(Icons.monochrome_photos_outlined),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0),
                    hintStyle: TextStyle(
                      height: 1,
                      color: globalcolors.textcolor,
                    )
                  ),
              
                    ),
                 
                  ),
                    ),
                SizedBox(width: 10,),
                     Expanded(child:   SizedBox(
                      width:5,
                      
                       child: ElevatedButton(
                                   
                                style: ElevatedButton.styleFrom(
                                   
                                  shape: RoundedRectangleBorder(
                                   
                                      borderRadius: BorderRadius.circular(15.0)),
                                  foregroundColor: globalcolors.maincolor,
                                  backgroundColor: globalcolors.notetcolor,
                                 
                                ),
                                child:
                                Text("+",
                                  style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
                                ),
                                onPressed: ()  async {
                                  final ImagePicker _picker = ImagePicker();
                                  final XFile? image =
                                  await _picker.pickImage(source: ImageSource.camera);
                                  if (image != null) {
                                    pickedImage = File(image.path);
                                    setState(() {
                                      isPicked = true;
                                    });
                                    pathimg=image.path.split("/").last;
                                    pathcntoraler=TextEditingController(text: pathimg);
                                    print(pathimg);
                                  }
                                },
                              ),
                     ),
                     ),
                          
                    
                  ],
                ),
                 ),
              ),
              // SizedBox(


                   
              //       ),
               const SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
                  
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
                   
              //     ],
              //   ),
              // ),
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
                          backgroundColor: globalcolors.textcolor,
                          minimumSize: Size(250, 50),
                        ),
                        child:
                        Text("${getLang(context, "added")}",
                          style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
                        ),
                        onPressed: ()  {
                          if(countcntoraler.text.isNotEmpty && namecntoraler.text.isNotEmpty
                          && oldpricecntoraler.text.isNotEmpty && newpricecntoraler.text.isNotEmpty
                           && pathimg.isNotEmpty){
                           putproduct(countcntoraler.text,namecntoraler.text,oldpricecntoraler.text,
                           newpricecntoraler.text,dropdownValue,pathimg);

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
            ],
        ),
        ),
      ),
    );
  }
  
  void putproduct(String count, String name, String oldprice, String newprice, String type, String pathimg)async {
final prefs = await SharedPreferences.getInstance();
  String nameperson= prefs.get("supermarket").toString();


var res=await fetch1.putpro(count,name,oldprice,newprice,type,pathimg,nameperson).then((res) {

print(res.toString());
Route route=MaterialPageRoute(builder: (_)=>home());
      navigator?.pushReplacement(route);


   
});


  }
}