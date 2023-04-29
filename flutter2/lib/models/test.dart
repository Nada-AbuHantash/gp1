enum Shade { orange, green }

class test11{
  final String x;
  final String y;

  // final int price;
  // final int  amount;
  // final int id;
  // // final String manufacturing;
  // final String image;
  // // final int productNumber;

  final String? description;
  final bool inCart;
  final Shade shade;

  factory test11.fromJson(Map<String,dynamic> json) => test11(
    x: json['xlocation']  == null ? '' : json['xlocation']as String,
    y: json['ylocation']  == null ? '': json['ylocation']as String,
    // amount: json['numitem']  == null ? 0 : json['numitem'] as int,
    // price: json['totalprice'] == null ? 0 : json['totalprice'] as int,
    // id: json['idcart']  == null ? 0 : json['idcart']as int,
    // image: json['image']  == null ? '' : json['image']as String,
    // productNumber: json['productNumber']   == null ? 0 : json['productNumber'] as int,
  );

  test11({
    required this.x,
    required this.y,
    // required this.amount,
    // required this.price,
    //  required this.id,
    // required this.image,
    // // required this.productNumber,
    this.description,
    this.inCart = false,
    this.shade = Shade.green,
  });





  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xlocation'] = this.x;
    data['ylocation'] = this.y;
    // data['numitem'] = this.amount;
    // data['totalprice'] = this.price;

    //  data['idcart'] = this.id;
    // data['image'] = this.image;
    // data['productNumber'] = this.productNumber;

    return data;
  }

}
