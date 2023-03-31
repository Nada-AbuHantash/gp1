import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/Sharedsession.dart';

class utils {
  static const String basurl = "http://192.168.225.52:3000/";
  //var url = Uri.parse('https://example.com');
}
class rest_api{

Future userlogin(String email, String pass) async {
  try {
    final http.Response use = await http.post(
        Uri.parse(utils.basurl + 'infouser'),
        headers: {"Accept": "Application/json"},
        body: {'useremail': email, 'userpass': pass});
    if (use.body.contains("@")) {
      print("yes ");
      Sharedsession shared = new Sharedsession();
      await shared.savename(email, pass);
      ///////////saved////////////
    } else
      print("failed");
    return use;
  } catch (e) {
    print('no');
  }
}
Future deliverylogin(String email, String pass) async {
   var jsonString;
  try {
    final http.Response use = await http.post(
        Uri.parse(utils.basurl + 'logindelivery'),
        headers: {"Accept": "Application/json"},
        body: {'deliveryemail': email, 'deliverypass': pass});
    if (use.body.contains("@")) {
       if (use.statusCode == 200) {
Sharedsession shared = new Sharedsession();
      await shared.savename(email, pass);
    } else {
      // show error
      print("Try Again");
    }
      print("yes ");
      
      ///////////saved////////////
    } else
      print("failed");
    return use;
  } catch (e) {
    print('no');
  }
}
Future sellerlogin(String email, String pass) async {
   var jsonString;
  try {
    final http.Response use = await http.post(
        Uri.parse(utils.basurl + 'loginseller'),
        headers: {"Accept": "Application/json"},
        body: {'selleremail': email, 'sellerpass': pass});
    if (use.body.contains("@")) {
       if (use.statusCode == 200) {
Sharedsession shared = new Sharedsession();
      await shared.savename(email, pass);
    } else {
      // show error
      print("Try Again");
    }
      print("yes ");
      
      ///////////saved////////////
    } else
      print("failed");
    return use;
  } catch (e) {
    print('no');
  }
}
Future sellercard1(String name, String card,String nameperson) async {
   
  try {
    final http.Response use = await http.post(
        Uri.parse(utils.basurl + 'walletseller'),
        headers: {"Accept": "Application/json"},
        body: {'suparmarketname': name, 'sellercard': card,
        'selleremail':nameperson});
    var encodeFirst = json.encode(use.body);
    var data = json.decode(encodeFirst);
    if (use.statusCode == 400) {
      // return null;
      print("Failed to update");
    } else {
     
      return data;
    }
      print("yes ");
      
      ///////////saved////////////
    
  } catch (e) {
    print('no');
  }
}


Future deliverycard1(String card,String nameperson) async {
   
  try {
    final http.Response use = await http.post(
        Uri.parse(utils.basurl + 'walletdelivery'),
        headers: {"Accept": "Application/json"},
        body: { 'deliverycard': card,
        'deliveryemail':nameperson});
    var encodeFirst = json.encode(use.body);
    var data = json.decode(encodeFirst);
    if (use.statusCode == 400) {
      // return null;
      print("Failed to update");
    } else {
     
      return data;
    }
      print("yes ");
      
      ///////////saved////////////
    
  } catch (e) {
    print('no');
  }
}


Future usersignup(
    String name, String email, String pass, String phone, String place) async {
  try {
    var s = 200;
    final http.Response use =
        await http.post(Uri.parse(utils.basurl + 'register'), headers: {
      "Accept": "Application/json"
    }, body: {
      'username': name,
      'useremail': email,
      'userpass': pass,
      'userphone': phone,
      'userplace': place
    });
    var encodeFirst = json.encode(use.body);
    var data = json.decode(encodeFirst);
    if (use.statusCode == 400) {
      // return null;
      print("Failed to update");
    } else {
      //return model.fromJson(data["data"]);
      return data;
    }
  } catch (e) {
    print("no register");
  }
}

Future deliverysignup(
    String name, String email, String pass, String phone, String place) async {
  try {
    var s = 200;
    final http.Response use =
        await http.post(Uri.parse(utils.basurl + 'registerdelivery'), headers: {
      "Accept": "Application/json"
    }, body: {
      'deliveryname': name,
      'deliveryemail': email,
      'deliverypass': pass,
      'deliveryphone': phone,
      'deliveryplace': place
    });
    var encodeFirst = json.encode(use.body);
    var data = json.decode(encodeFirst);
    if (use.statusCode == 400) {
      // return null;
      print("Failed to update");
    } else {
      Sharedsession shared = new Sharedsession();
      await shared.savename(email, pass);
      return data;
    }
  } catch (e) {
    print("no register");
  }
}

Future sellersignup(
    String name, String email, String pass, String phone, String place) async {
  try {
    var s = 200;
    final http.Response use =
        await http.post(Uri.parse(utils.basurl + 'registerseller'), headers: {
      "Accept": "Application/json"
    }, body: {
      'sellername': name,
      'selleremail': email,
      'sellerpass': pass,
      'sellerphone': phone,
      'sellerplace': place
    });
    var encodeFirst = json.encode(use.body);
    var data = json.decode(encodeFirst);
    if (use.statusCode == 400) {
      // return null;
      print("Failed to update");
    } else {
      Sharedsession shared = new Sharedsession();
      await shared.savename(email, pass);
      //return model.fromJson(data["data"]);
      return data;
    }
  } catch (e) {
    print("no register");
  }
}

Future putpro(
    String count, String namepro, String oldprice, String newprice, String type,String path,String nameperson) async {
  try {
    var s = 200;
    final http.Response use =
        await http.post(Uri.parse(utils.basurl + 'registerproduct'), headers: {
      "Accept": "Application/json"
    }, body: {
      'productcount':count,
      'productname': namepro,
      'oldprice': oldprice,
      'newprice': newprice,
      'producttype': type,
      '	productimage': path,
      'nameperson':nameperson,

    });
    var encodeFirst = json.encode(use.body);
    var data = json.decode(encodeFirst);
    if (use.statusCode == 400) {
      // return null;
      print("Failed to update");
    } else {
    
      //return model.fromJson(data["data"]);
      return data;
    }
  } catch (e) {
    print("no register");
  }
}
Future getinfo1() async {
  final prefs = await SharedPreferences.getInstance();
  String A = prefs.get("emailemail").toString();
  String B = prefs.get("passpass").toString();
  var jsonString;
  try {
    // await http.post(Uri.parse(utils.basurl + 'registerseller'), headers: {
    http.Response res = await http.get(
        Uri.parse(
            utils.basurl + '/editprofile?useremail=' + A + '&&userpass=' + 'B'),
        headers: {'Content-Type': 'application/json'});
    if (res.statusCode == 200) {
      jsonString = json.decode(res.body) as List;
    } else {
      // show error
      print("Try Again");
    }
  } catch (e) {
    print("no info");
  }
  return jsonString;
}
}