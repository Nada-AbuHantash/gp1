enum Shade { orange, green }

class Product1 {
  final String marketName;
  final String productName;

  final int price;
  final int  amount;
  final int id;
  // final String manufacturing;
  final String image;
  // final int productNumber;

  final String? description;
  final bool inCart;
  final Shade shade;

  factory Product1.fromJson(Map<String,dynamic> json) => Product1(
    marketName: json['namesuper']  == null ? '' : json['namesuper']as String,
    productName: json['nameitem']  == null ? '' : json['nameitem']as String,
    amount: json['numitem']  == null ? 0 : json['numitem'] as int,
    price: json['totalprice'] == null ? 0 : json['totalprice'] as int,
    id: json['idcart']  == null ? 0 : json['idcart']as int,
    image: json['image']  == null ? '' : json['image']as String,
    // productNumber: json['productNumber']   == null ? 0 : json['productNumber'] as int,
  );

  Product1({
    required this.marketName,
    required this.productName,
    required this.amount,
    required this.price,
     required this.id,
    required this.image,
    // required this.productNumber,
    this.description,
    this.inCart = false,
    this.shade = Shade.green,
  });





  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['namesuper'] = this.marketName;
    data['nameitem'] = this.productName;
    data['numitem'] = this.amount;
    data['totalprice'] = this.price;

     data['idcart'] = this.id;
    data['image'] = this.image;
    // data['productNumber'] = this.productNumber;

    return data;
  }

}
