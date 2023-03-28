
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';

class textfiledformat extends StatelessWidget{
  final TextEditingController controller;
 final String text;
 final TextInputType textInputType;
 final bool obscure;
final Icon icon;
  const textfiledformat({ required this.controller, required this.text, required this.textInputType, required this.obscure, required this.icon });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(height:55,
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
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
    decoration: InputDecoration(
iconColor: globalcolors.textcolor,
 
      hintText: text,
      icon: icon,
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(0),
      hintStyle: TextStyle(
        height: 1,
        color: globalcolors.textcolor,
      )
    ),

      ),
    );
    throw UnimplementedError();
  }

}