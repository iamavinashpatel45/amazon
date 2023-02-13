import 'package:amazon/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class sliderimages_user extends StatelessWidget {
  const sliderimages_user({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: global_variables.carouselImages.map(
        (e) {
          return Image.network(
            e,
            fit: BoxFit.cover,
            height: 200,
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
