// import 'package:flutter/material.dart';
// import 'package:flutter2/view/cart/cart.dart';
// import 'package:flutter2/view/dilevery/all.dart';
// import 'package:flutter2/view/dilevery/markets.dart';
// import 'package:flutter2/view/dilevery/cust.dart';
// import 'package:flutter2/view/test.dart';
// import 'package:flutter2/utils/globalColors.dart';
//
// import '../cart/cart3.dart';
// class filter  extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 3,
//
//         child:
//         Scaffold(
//           appBar: PreferredSize(
//             // backgroundColor: globalcolors.besiccolor,
//             preferredSize: Size.fromHeight(kToolbarHeight),
//             // title: const Text(''),
//
//             child: Container(
//               color: globalcolors.besiccolor,
//               child: TabBar(
//                 indicatorColor: globalcolors.textcolor,
//                 indicatorWeight: 6,
//                 labelColor: globalcolors.textcolor,
//                 tabs: [
//                   Tab(
//                     child: Text("all"),
//                     icon: Icon(Icons.track_changes),
//                   ),
//                   Tab(
//                     child: Text("markets"),
//                     icon: Icon(Icons.checklist_rtl_sharp),
//                   ),
//                   Tab(
//                     child: Text("custmers"),
//                     icon: Icon(Icons.track_changes),
//                   ),
//
//                 ],
//
//               ),
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               all(),
//               cart1(),
//               cart03(),
//               // markets(),
//               // cust(),
//             ],
//           ),
//         )
//
//       // ]
//     );
//     // );
//   }
// }