enum Shade { orange, green }

class super2{
  final String marketName;
  final String userName;
  final int flag;
  final int userphone;
  final String state;
   final String date;
    final String time;
  final String dilName;
  final int price;
  final int  amount;
  final int id;
  // final String manufacturing;
 final int pls;
  // final int productNumber;

  final String? description;
  final bool inCart;
  final Shade shade;

  factory super2.fromJson(Map<String,dynamic> json) => super2(
    marketName: json['namesupermarket']  == null ? '' : json['namesupermarket']as String,
    userName: json['nameuser']  == null ? '' : json['nameuser']as String,
    dilName: json['namedelivery']  == null ? '' : json['namedelivery']as String,
    date: json['date']  == null ? '' : json['date']as String,
    time: json['time']  == null ? '' : json['time']as String,
    state: json['orderstatus']  == null ? '' : json['orderstatus']as String,
    amount: json['count']  == null ? 0 : json['count'] as int,
    price: json['orderprice'] == null ? 0 : json['orderprice'] as int,
    id: json['orderid']  == null ? 0 : json['orderid']as int,
    pls: json['orderpercent']  == null ? 0 : json['orderpercent']as int,
    flag: json['flag'] == null ? 0 : json['flag'] as int,
    userphone: json['phoneuser'] == null ? 0 : json['phoneuser'] as int,
    // productNumber: json['productNumber']   == null ? 0 : json['productNumber'] as int,
  );

  super2({
    required this.marketName,
    required this.userName,
    required this.amount,
   required this.date,
    required this.time,
    required this.price,
    required this.id,
    required this.pls,
     required this.userphone,
    required this.state,
    required this.dilName,
    required this.flag,
    // required this.productNumber,
    this.description,
    this.inCart = false,
    this.shade = Shade.green,
  });





  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['namesupermarket'] = this.marketName;
    data['nameuser'] = this.userName;
     data['namedelivery'] = this.dilName;
      data['date'] = this.date;
       data['time'] = this.time;
     data['orderstatus'] = this.state;
    data['count'] = this.amount;
    data['orderprice'] = this.price;
data['phoneuser'] = this.userphone;
    data['orderid'] = this.id;
    data['flag'] = this.flag;
    data['orderpercent'] = this.pls;
    // data['productNumber'] = this.productNumber;

    return data;
  }

}
