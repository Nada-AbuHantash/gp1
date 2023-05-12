enum Shade { orange, green }

class filter1{
  final String marketName;
  final String userName;

  final int price;
  final int  amount;
  final int id;
  // final String manufacturing;
 // final String image;
  // final int productNumber;

  final String? description;
  final bool inCart;
  final Shade shade;

  factory filter1.fromJson(Map<String,dynamic> json) => filter1(
    marketName: json['namesupermarket']  == null ? '' : json['namesupermarket']as String,
    userName: json['nameuser']  == null ? '' : json['nameuser']as String,
    amount: json['numitem']  == null ? 0 : json['numitem'] as int,
    price: json['orderprice'] == null ? 0 : json['orderprice'] as int,
    id: json['orderid']  == null ? 0 : json['orderid']as int,
    //image: json['image']  == null ? '' : json['image']as String,
    // productNumber: json['productNumber']   == null ? 0 : json['productNumber'] as int,
  );

  filter1({
    required this.marketName,
    required this.userName,
    required this.amount,
    required this.price,
    required this.id,
    //required this.image,
    // required this.productNumber,
    this.description,
    this.inCart = false,
    this.shade = Shade.green,
  });





  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['namesupermarket'] = this.marketName;
    data['nameuser'] = this.userName;
    data['numitem'] = this.amount;
    data['orderprice'] = this.price;

    data['orderid'] = this.id;
    //data['image'] = this.image;
    // data['productNumber'] = this.productNumber;

    return data;
  }

}
