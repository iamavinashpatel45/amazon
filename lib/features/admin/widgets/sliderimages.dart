import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class sliderimages_admin extends StatelessWidget {
  final List<File> images;

  const sliderimages_admin({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map(
        (e) {
          return Image.file(
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
