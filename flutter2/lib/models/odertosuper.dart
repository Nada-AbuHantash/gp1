enum Shade { orange, green }

class super2{
  final String marketName;
  final String userName;

  final int price;
  final int  amount;
  final int id;
  // final String manufacturing;
 final String pls;
  // final int productNumber;

  final String? description;
  final bool inCart;
  final Shade shade;

  factory super2.fromJson(Map<String,dynamic> json) => super2(
    marketName: json['namesupermarket']  == null ? '' : json['namesupermarket']as String,
    userName: json['nameuser']  == null ? '' : json['nameuser']as String,
    amount: json['count']  == null ? 0 : json['count'] as int,
    price: json['orderprice'] == null ? 0 : json['orderprice'] as int,
    id: json['orderid']  == null ? 0 : json['orderid']as int,
    pls: json['orderpercent']  == null ? '' : json['orderpercent']as String,
    // productNumber: json['productNumber']   == null ? 0 : json['productNumber'] as int,
  );

  super2({
    required this.marketName,
    required this.userName,
    required this.amount,
    required this.price,
    required this.id,
    required this.pls,
    // required this.productNumber,
    this.description,
    this.inCart = false,
    this.shade = Shade.green,
  });





  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['namesupermarket'] = this.marketName;
    data['nameuser'] = this.userName;
    data['count'] = this.amount;
    data['orderprice'] = this.price;

    data['orderid'] = this.id;
    data['orderpercent'] = this.pls;
    // data['productNumber'] = this.productNumber;

    return data;
  }

}
