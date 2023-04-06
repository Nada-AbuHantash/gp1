import 'dart:convert';
import 'dart:io';
import 'package:flutter2/view/profile.dart';
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
import 'package:intl/intl.dart';
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
  TextEditingController dateInput = TextEditingController();

  late String pathimg="";
  

  String dropdownValue = list.first;
  String per="0.2";
  File? pickedImage;
  bool isPicked = false;
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }


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


              Container(
            height:55,
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
            child: TextFormField(
              style: TextStyle(color:globalcolors.textcolor),
              controller: dateInput,
              keyboardType: TextInputType.datetime,
              obscureText: false,
              decoration: InputDecoration(
                  iconColor: globalcolors.textcolor,

                  hintText: "${getLang(context, "date")}",
                  icon: Icon(Icons.calendar_today),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(
                    height: 1,
                    color: globalcolors.textcolor,
                  )
              ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateInput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },

            ),
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
                            if(dropdownValue==list.first){per="0.20";}
                            else if(dropdownValue==list.last){per="0.15";}
                            else if(2==list.indexOf(dropdownValue)){per="0.08";}
                            else if(1==list.indexOf(dropdownValue)){per="0.10";}
                           putproduct(countcntoraler.text,namecntoraler.text,oldpricecntoraler.text,
                           newpricecntoraler.text,dropdownValue,pathimg,dateInput.text,per);

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
  
  void putproduct(String count, String name, String oldprice, String newprice, String type, String pathimg,String exp,String per )async {
final prefs = await SharedPreferences.getInstance();
  String nameperson= prefs.get("supermarket").toString();


var res=await fetch1.putpro(count,name,oldprice,newprice,type,pathimg,nameperson,exp,per).then((res) {

print(res.toString());
Route route=MaterialPageRoute(builder: (_)=>home());
      navigator?.pushReplacement(route);


   
});


  }
}