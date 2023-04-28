// import 'package:flutter/material.dart';
//
// class Product {
//   String name;
//   double price;
//   String imageUrl;
//
//   Product({required this.name, required this.price, required this.imageUrl});
// }
//
// class Cart {
//   List<Product> items = [];
// }
//
// class CartPage extends StatefulWidget {
//   const CartPage({Key? key}) : super(key: key);
//
//   @override
//   _CartPageState createState() => _CartPageState();
// }
//
// class _CartPageState extends State<CartPage> {
//   Cart _cart = Cart();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _cart.items.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   leading: Image.network(_cart.items[index].imageUrl),
//                   title: Text(_cart.items[index].name),
//                   subtitle: Text('\$${_cart.items[index].price.toStringAsFixed(2)}'),
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Text(
//               Text('Total Cost: \$${totalCost.toStringAsFixed(2)}'),
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
