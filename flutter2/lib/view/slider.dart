import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class slider extends StatefulWidget {
  @override
  _sliderState createState() => _sliderState();
}

class _sliderState extends State<slider> {
  List<String> imagesList = [
    "https://thumbs.dreamstime.com/z/d-isometric-vector-concept-mobile-grocery-list-shopping-app-flat-181622871.jpg",
    "https://barn2.com/wp-content/uploads/2018/03/Create-a-WooCommerce-Price-List-Blog-Header-820x369.png",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz94eeo8JMzupDzTlwT0gQ41B9h-BCLUOZ4g&usqp=CAU",
    "https://www.evolutionnutrition.com/sites/default/files/article-images/Online%20Grocery%20Inside.jpg",
  ];

  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Slider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: imagesList.map((imageUrl) {
              return Image.network(imageUrl, fit: BoxFit.cover);
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagesList.map((imageUrl) {
              int index = imagesList.indexOf(imageUrl);
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentImageIndex == index
                      ? Colors.blueAccent
                      : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
