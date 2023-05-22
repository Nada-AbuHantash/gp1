import 'package:flutter/material.dart';

import 'package:flutter2/utils/globalColors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/applocal.dart';
import '../editprofile.dart';


class cart1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      color: globalcolors.textcolor,

      home: ProductPage(
        name: 'Product Name',
        sname:'supermarket name',
        imageUrl: "assets/images/market.png",
        oprice: 10,
        nprice: 8,
        date: 'mm/dd/yy',
        id:32,
        //description: 'Product Description',
      ),
    );
  }
}

class ProductPage extends StatefulWidget {
  final String name;
  final String sname;
  final String imageUrl;
  final int oprice;
  final int nprice;
  final String date;
  final int id;
 // final String description;

  const ProductPage( {
    required this.name,
    required this.sname,
    required this.imageUrl,
    required this.oprice,
    required this.nprice,
    required this.date,
    required this.id,
   // this.description = '',
  });

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globalcolors.besiccolor,
        title: Text("Shop now !",
          style: TextStyle(color: globalcolors.notetcolor)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              widget.imageUrl,

              width: 10,
              height: 10,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //  SizedBox(height: 40,),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: globalcolors.textcolor,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.sname,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: globalcolors.textcolor,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.date,
                  style: TextStyle(fontSize: 20.0,color: globalcolors.textcolor,),

                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      'Old Price ${widget.oprice}\₪',

                      style: TextStyle(
                         decoration: TextDecoration.lineThrough,
                        fontSize: 20.0,
                        // fontWeight: FontWeight.bold,
                        color: globalcolors.textcolor,
                      ),
                    ),
                    Row(
                      children: [

                        Text(
                          'New Price ${widget.nprice}\₪',
                          style: TextStyle(
                            fontSize: 20.0,
                            // fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Quantity',
                style: TextStyle(
                  fontSize: 20.0,
                  color: globalcolors.textcolor,
                ),),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove,color: globalcolors.textcolor,),
                          onPressed: () {
                            setState(() {
                              _quantity = _quantity > 1 ? _quantity - 1 : 1;
                            });
                          },
                        ),
                        Text('$_quantity',style: TextStyle(color: globalcolors.textcolor, fontSize: 20),),
                        IconButton(
                          icon: Icon(Icons.add,color: globalcolors.textcolor,),
                          onPressed: () {
                            setState(() {
                              _quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 110.0),

                ElevatedButton(

                  style: ElevatedButton.styleFrom(

                    shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(20.0)),
                    foregroundColor: globalcolors.maincolor,
                    backgroundColor: globalcolors.notetcolor,
                    minimumSize: Size(250, 50),
                  ),
                  child: Text("Add to Cart",

                    style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
                  ),
                  onPressed: ()  {
                    addtocart(widget.name,_quantity ,widget.id);
                    print(_quantity);

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  void addtocart( String name, int count,int id )async {

var res=await fetch1.addcart(count,name,id).then((res) {
if(res!=null){
  
Fluttertoast.showToast(msg: "The product has been added to the cart",
          textColor: globalcolors.besiccolor);

}else{
print(res.toString());

Fluttertoast.showToast(msg: "The quantity is not available",
          textColor: globalcolors.besiccolor);

}
});


  }
}
