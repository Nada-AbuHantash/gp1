enum Shade { orange, green }

class super1{
  final String marketName;


  final String? description;
  final bool inCart;
  final Shade shade;

  factory super1.fromJson(Map<String,dynamic> json) => super1(
    marketName: json['namesupermarket']  == null ? '' : json['namesupermarket']as String,
 
  );

  super1({
    required this.marketName,
    this.description,
    this.inCart = false,
    this.shade = Shade.green,
  });





  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['namesupermarket'] = this.marketName;
    // data['nameuser'] = this.userName;
    // data['numitem'] = this.amount;
    // data['orderprice'] = this.price;

    // data['orderid'] = this.id;
    //data['image'] = this.image;
    // data['productNumber'] = this.productNumber;

    return data;
  }

}
