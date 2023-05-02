import 'package:flutter/material.dart';
import 'package:flutter2/view/cart2.dart';
import 'package:flutter2/view/cart3.dart';

import 'package:flutter2/view/test.dart';
import 'package:flutter2/utils/globalColors.dart';
class mycart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,

        child:
        Scaffold(
          appBar: PreferredSize(
            // backgroundColor: globalcolors.besiccolor,
            preferredSize: Size.fromHeight(kToolbarHeight),
            // title: const Text(''),

            child: Container(
              color: globalcolors.besiccolor,
              child: TabBar(
                indicatorColor: globalcolors.textcolor,
                indicatorWeight: 6,
                labelColor: globalcolors.textcolor,
                tabs: [
                  Tab(
                    child: Text("My Cart"),
                    icon: Icon(Icons.shopping_cart),
                  ),
                  Tab(
                    child: Text("Buy"),
                    icon: Icon(Icons.monetization_on_outlined),
                  ),
                  Tab(
                    child: Text("Boke"),
                    icon: Icon(Icons.timer_outlined),
                  ),
                ],

              ),
            ),
          ),
          body: TabBarView(
            children: [
              cart2(),
              cart3(),
              MapScreen(),
            ],
          ),
        )

      // ]
    );
    // );
  }
}