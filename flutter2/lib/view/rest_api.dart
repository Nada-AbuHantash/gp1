import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter2/view/map/marah.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product1.dart';
import '../utils/Sharedsession.dart';
import 'package:flutter2/models/product.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/Sharedsession.dart';
import 'package:flutter2/models/product.dart';
import 'package:flutter2/mudel/pos.dart';
class utils {
  static const String basurl = "http://192.168.52.52:3000/";
//var url = Uri.parse('https://example.com');
}
class rest_api{
  Future Feedback( rate,String email) async {
    try {
      final http.Response use = await http.post(
          Uri.parse(utils.basurl + 'feedback'),
          headers: {"Accept": "Application/json"},
          body: {'email': email, 'rate': rate.toString(),});
      var encodeFirst = json.encode(use.body);
      var data = json.decode(encodeFirst);
      if (use.statusCode == 400) {

      } else {
        // show error
        return data;

      }


    } catch (e) {
      print(e);
      print('no00');
    }
  }
  Future userlogin(String email, String pass) async {
    try {
      final http.Response use = await http.post(
          Uri.parse(utils.basurl + 'infouser'),
          headers: {"Accept": "Application/json"},
          body: {'useremail': email, 'userpass': pass});
      if (use.body.contains("@")) {
        if (use.statusCode == 200) {
          Sharedsession shared = new Sharedsession();
          await shared.savename(email, pass);
        } else {
          // show error
          print("Try Again");
        }
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
    //  var namesuper;
    try {
      final http.Response use1 = await http.post(
          Uri.parse(utils.basurl + 'loginseller'),
          headers: {"Accept": "Application/json"},
          body: {'selleremail': email, 'sellerpass': pass});
      if (use1.body.contains("@")) {
        if (use1.statusCode == 200) {
          Sharedsession shared = new Sharedsession();
          await shared.savename(email, pass);

          //  print(namesuper);
        } else {
          // show error
          print("Try Again");
        }

        print("yes ");

        ///////////saved////////////
      } else
        print("failed");
      return use1;
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
        Sharedsession shared = new Sharedsession();
        await shared.savenamesuper(name);
        return data;
      }
      print("yes ");

      ///////////saved////////////

    } catch (e) {
      print('no');
    }
  }
  Future addlocation(String email,double x,double y) async {
    String  xlocation = x.toString();
    String  ylocation = y.toString();
    try {
      final http.Response use = await http.post(
          Uri.parse(utils.basurl + 'locationseller'),
          headers: {"Accept": "Application/json"},
          body: { 'email': email,
            'xlocation':xlocation,
            'ylocation':ylocation});
      var encodeFirst = json.encode(use.body);
      var data = json.decode(encodeFirst);
      if (use.statusCode == 400) {
        print("Failed to update");
      } else {

        return data;
      }
      print("yes ");

      ///////////saved////////////

    } catch (e) {
      print(e);
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
  Future addcart( int num, String item ,int id) async {
    final prefs = await SharedPreferences.getInstance();
    String A = prefs.get("emailemail").toString();
    try {

      final http.Response use =
      await http.get(Uri.parse(utils.basurl + 'addcart?emailcust=$A&nameitem=$item&numitem=$num&id=$id'), headers: {
        "Accept": "Application/json"
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

  Future updatecard(
      String email, String card ) async {
    try {
      var s = 200;
      final http.Response use =
      await http.post(Uri.parse(utils.basurl + 'updatecard'), headers: {
        "Accept": "Application/json"
      }, body: {

        'email': email,
        'card': card,


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

  Future userupdate(
      String name, String pass, String phone, String place , String email) async {
    try {
      var s = 200;
      final http.Response use =
      await http.post(Uri.parse(utils.basurl + 'userupdate'), headers: {
        "Accept": "Application/json"
      }, body: {
        'username': name,
        'useremail': email,
        'userpass': pass,
        'userphone': phone,
        'userplace': place,

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
      String count, String namepro, String oldprice, String newprice, String type,String path,String nameperson ,String exp,String per) async {
    try {
      var s = 200;
      final http.Response use =
      await http.get(Uri.parse(utils.basurl + 'addpro?productcount=$count&productname=$namepro&oldprice=$oldprice&newprice=$newprice&producttype=$type&productimage=$path&exp=$exp&per=$per&namesupermarket=$nameperson'), 
      headers: {
        "Accept": "Application/json"
      });
      var encodeFirst = json.encode(use.body);
      var data = json.decode(encodeFirst);
      if (use.statusCode == 400) {

        print("Failed to update");
      } else {

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

      http.Response res = await http.get(
        Uri.parse(
            utils.basurl+'editprofile?useremail=$A'),
        headers: {'Content-Type': 'application/json'},
        // body: {
        //       'useremail':A,
        //       'userpass':B}
      );
      if (res.statusCode == 200) {
        jsonString = json.decode(res.body) as List;

      } else {
        // show error
        print(res.statusCode);
        print("Try Again");
      }
      return jsonString;
    } catch (e) {
      print(e);
      print("no info");
    }
    return jsonString;
  }
  Future getinfo2() async {
    final prefs = await SharedPreferences.getInstance();
    String A = prefs.get("emailemail").toString();
    String B = prefs.get("passpass").toString();
    var jsonString;
    try {

      http.Response res = await http.get(
        Uri.parse(
            utils.basurl+'profileseller?useremail=$A'),
        headers: {'Content-Type': 'application/json'},
        // body: {
        //       'useremail':A,
        //       'userpass':B}
      );
      if (res.statusCode == 200) {
        jsonString = json.decode(res.body) as List;

      } else {
        // show error
        print(res.statusCode);
        print("Try Again");
      }
      return jsonString;
    } catch (e) {
      print(e);
      print("no info");
    }
    return jsonString;
  }
  Future getinfo3() async {
    final prefs = await SharedPreferences.getInstance();
    String A = prefs.get("emailemail").toString();
    String B = prefs.get("passpass").toString();
    var jsonString;
    try {

      http.Response res = await http.get(
        Uri.parse(
            utils.basurl+'profildel?useremail=$A'),
        headers: {'Content-Type': 'application/json'},
        // body: {
        //       'useremail':A,
        //       'userpass':B}
      );
      if (res.statusCode == 200) {
        jsonString = json.decode(res.body) as List;

      } else {
        // show error
        print(res.statusCode);
        print("Try Again");
      }
      return jsonString;
    } catch (e) {
      print(e);
      print("no info");
    }
    return jsonString;
  }
  Future <List<Product>> most() async {
    late  List<Product> myList=[];

    http.Response res = await http.get(Uri.parse(utils.basurl + 'viewpro'),
        headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      var jsonString = json.decode(res.body);
      List<Product> list =
      List<Product>.from(jsonString.map((i) => Product.fromJson(i)));
      myList = list;

    } else {

      throw Exception('Failed to load album');
    } return myList;
  }
  Future <List<Product1>> cart() async {
    late  List<Product1> myList2=[];
    final prefs = await SharedPreferences.getInstance();
    String A = prefs.get("emailemail").toString();
    http.Response res = await http.get(Uri.parse(utils.basurl + 'viewcart?email=$A'),
        headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {


      var jsonString = json.decode(res.body);
      List<Product1> list =
      List<Product1>.from(jsonString.map((i) => Product1.fromJson(i)));
      myList2 = list;

    } else {
      throw Exception('Failed to load album');
    } return myList2;
  }

  Future <List<Product>> most2(String name) async {
    late  List<Product> myList=[];

    http.Response res = await http.get(Uri.parse(utils.basurl + 'viewproseller?namesupermarket=$name'),
        headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {


      var jsonString = json.decode(res.body);
      List<Product> list =
      List<Product>.from(jsonString.map((i) => Product.fromJson(i)));
// List<Product> products = jsonString.map((jsonMap) => Product.fromJson(jsonMap)).toList();
      myList = list;

    } else {

      throw Exception('Failed to load album');
    } return myList;
  }

  Future<List<TaxiModel>> FetchTaxis() async {
    var res = await http.get(Uri.parse(utils.basurl + "viewloca"));
      print(res);
    var body = json.decode(res.body) as List;
  
    return body.map((i) => TaxiModel.fromJson(i)).toList();

  }

   

// Future<void> myAsyncMethod() async {
//   try {
//     // Call platform-specific API
//   } on PlatformException catch (e) {
//     // Handle the exception
//   }
// }

  Future deleteitems(int id)async{
  
    http.Response res = await http.get(Uri.parse(utils.basurl+'deletefromcart?id=$id'),
        headers: {'Content-Type': 'application/json'});
    if (res.statusCode == 200) {
    } else {

      throw Exception('Failed to load album');
    }
  }
}