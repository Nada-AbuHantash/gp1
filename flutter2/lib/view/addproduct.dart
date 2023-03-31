import 'dart:convert';
import 'dart:io';
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
import 'editprofail.dart';
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
  late String pathimages="";

  String dropdownValue = list.first;
  File? pickedImage;
  bool isPicked = false;
  @override
  Widget build(BuildContext context){
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Center(
        child: Container(
          color: globalcolors.besiccolor,
          width: width,
          height: height,
          child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  const SizedBox(height: 40),
                  Text("${getLang(context, "addproducts")}",
                    style: TextStyle(fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: globalcolors.textcolor)
                    ,),
                  const SizedBox(height: 20),
                  textfiledformat(controller:namecntoraler,
                    text:"${getLang(context, "productname")}",
                    obscure: false,
                    textInputType: TextInputType.text,
                    icon: new Icon(Icons.production_quantity_limits),
                  ),
                  const SizedBox(height: 20),
                  textfiledformat(controller:oldpricecntoraler,
                
                    text:"${getLang(context, "oldprice")}",
                    obscure: false,
                    textInputType: TextInputType.number,
                    icon: new Icon(Icons.money_off),
                  ),
                  const SizedBox(height: 20),
                  textfiledformat(controller:newpricecntoraler,
                
                    text:"${getLang(context, "newprice")}",
                    obscure: false,
                    textInputType: TextInputType.number,
                    icon: new Icon(Icons.attach_money),
                  ),
                  const SizedBox(height: 20),
                  textfiledformat(controller:countcntoraler,
                
                    text:"${getLang(context, "count")}",
                    obscure: false,
                    textInputType: TextInputType.number,
                    icon: new Icon(Icons.numbers),
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
                            Text("${getLang(context, "addedimage")}",
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
                              //   String path=base64Encode(image.readAsBytes() as List<int>);
                                 print(image.path);
                                 pathimages=image.path;
                              }
                            },
                          ),
                        ),
                      ],
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
                              backgroundColor: globalcolors.textcolor,
                              minimumSize: Size(250, 50),
                            ),
                            child:
                            Text("${getLang(context, "added")}",
                              style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
                            ),
                            onPressed: ()  {

if( countcntoraler.text.isNotEmpty && namecntoraler.text.isNotEmpty
&& oldpricecntoraler.text.isNotEmpty && newpricecntoraler.text.isNotEmpty&& isPicked)
                       {
                          putproduct(countcntoraler.text, namecntoraler.text,
                           oldpricecntoraler.text,newpricecntoraler.text,dropdownValue,pathimages);
      }else{Fluttertoast.showToast(msg: "${getLang(context, "somefiled")}",
          textColor: globalcolors.besiccolor);}

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
      ),
    );
  }
  
  void putproduct(String count, String namepro, String oldprice, String newprice, String type,String path) async{
final prefs = await SharedPreferences.getInstance();
  String nameperson= prefs.get("emailemail").toString();
var res=await fetch1.putpro(count,namepro,oldprice,newprice,type,path,nameperson).then((res) {

print(res.toString());
Route route=MaterialPageRoute(builder: (_)=>home());
      navigator?.pushReplacement(route);


   
});


  }
}