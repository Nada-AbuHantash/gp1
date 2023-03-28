import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter_svg/svg.dart';
class socialogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.6,
          alignment: Alignment.center,
          child: Text(
              '- or sign up in with -',
              style: TextStyle(
              color: globalcolors.textcolor,
              fontWeight: FontWeight.w600,
              ),
            ),
        ),
        const SizedBox(height: 20),
        Container(

          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  decoration: BoxDecoration(
                    color: globalcolors.maincolor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow:[ BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                    ),
                    ],
                  ),
                        
                        child: SvgPicture.asset('assets/images/go.svg',height:70),
                        
                        ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  decoration: BoxDecoration(
                    color: globalcolors.maincolor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow:[ BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                    ),
                    ],
                  ),
                        
                        child: SvgPicture.asset('assets/images/gity.svg',height:70),
                        
                        ),
              ),
              const SizedBox(width: 10),
               Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  decoration: BoxDecoration(
                    color: globalcolors.maincolor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow:[ BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                    ),
                    ],
                  ),
                        
                        child: SvgPicture.asset('assets/images/fec.svg',height:70),
                        
                        ),
              ),
            ],
          ),
        )
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}