import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_testting/carsol_details_screeen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

class CarsoulSlider extends StatelessWidget {
  Future getData() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("xaakib").getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CarsolSlider"),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: FutureBuilder(
              future: getData(),
              builder: (_, snapshot) {
                return CarouselSlider.builder(
                    slideBuilder: (index) {
                      DocumentSnapshot sliderimage = snapshot.data[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CoursolDetails()),
                          );
                        },
                        child: Container(
                          child: Image.network(
                            sliderimage['imageUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    slideTransform: CubeTransform(
                      rotationAngle: 0,
                    ),
                    slideIndicator: CircularWaveSlideIndicator(
                      indicatorBackgroundColor: Colors.red,
                      currentIndicatorColor: Colors.green,
                    ),
                    itemCount: snapshot.data.length);
              },
            ),
          ),
        ],
      ),
    );
  }
}
