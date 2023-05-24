import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../components/applocal.dart';
import '../signup.dart';


class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
     double width=MediaQuery.of(context).size.width;
  double height=MediaQuery.of(context).size.height;
     List<DataModel> dataList=

     [
       DataModel(

           "${getLang(context, "about1")}",
           "assets/images/shop11.png"),

       DataModel(
           "${getLang(context, "about2")}",
           "assets/images/market.png"),
       DataModel(
           "${getLang(context, "about3")}",
           "assets/images/delivery.png"),
     ];
     Widget carouselView(int index) {
       return carouselCard(dataList[index]);
     }
    return Scaffold(
      body: Container(
        color: globalcolors.besiccolor,
                width: width,
                height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: <Widget>[
               Padding(
                padding: EdgeInsets.all(40.0),
                child: Center(
                  child: Text("${getLang(context, "m1")}",
                       textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 75, 117),
                          fontSize: 30)),
                ),
              ),
              AspectRatio(
                aspectRatio: 0.90,
                
                child: PageView.builder(
                    itemCount: dataList.length,
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return carouselView(index);
                    }),
              )
            ],
          ),
        ),
      ),
         bottomNavigationBar: Container(
      height: 70,
      color: globalcolors.besiccolor,
      alignment: Alignment.center,
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Text("${getLang(context, "m")}",
        style: TextStyle(color: globalcolors.textcolor,fontSize: 16),),
        InkWell(
          onTap: () => {
             navigator?.pushReplacement(MaterialPageRoute(builder: (_)=>signup()))
          },
          
          child: Text("${getLang(context, "Signup")}",
          style: TextStyle(
color: globalcolors.notetcolor,
fontSize: 16,

          ),
          ),
        )
      ],

      ),
    ),
    );
  }



  Widget carouselCard(DataModel data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage(
                        data.imagename,
                      ),
                      fit: BoxFit.fill),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black26)
                  ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30,left: 12,right: 12),
          child: Text(
            "${data.title}",
              textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(255, 26, 75, 117),
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
class DataModel {
  final String title;
  final String imagename;
  DataModel(
      this.title,
      this.imagename,
      );
}

