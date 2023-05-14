enum Shade { orange, green }

class String1 {
  final String marketName;
  final String msg;

  final String namepro;
  final int  count;
  final int id;
  // final String manufacturing;
  final int idnotifi;
  // final int productNumber;

  final String? description;
  final bool inCart;
  final Shade shade;

  factory String1.fromJson(Map<String,dynamic> json) => String1(
    marketName: json['supetmarket']  == null ? '' : json['supetmarket']as String,
    msg: json['msg']  == null ? '' : json['msg']as String,
    count: json['count']  == null ? 0 : json['count'] as int,
    namepro: json['namepro'] == null ? '' : json['namepro'] as String,
    id: json['id']  == null ? 0 : json['id']as int,
    idnotifi: json['idnotification']  == null ? 0 : json['idnotification']as int,
    // productNumber: json['productNumber']   == null ? 0 : json['productNumber'] as int,
  );

  String1({
    required this.marketName,
    required this.msg,
    required this.count,
    required this.namepro,
     required this.id,
    required this.idnotifi,
    // required this.productNumber,
    this.description,
    this.inCart = false,
    this.shade = Shade.green,
  });





  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supetmarket'] = this.marketName;
    data['msg'] = this.msg;
    data['count'] = this.count;
    data['namepro'] = this.namepro;

     data['id'] = this.id;
    data['idnotification'] = this.idnotifi;
    // data['productNumber'] = this.productNumber;

    return data;
  }

}
