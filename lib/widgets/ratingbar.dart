import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ratingbar extends StatelessWidget {
  final double rating;
  const ratingbar({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      rating: rating,
      itemSize: 20,
      itemBuilder: (context, index) {
        return const Icon(
          Icons.star,
          color: global_variables.secondaryColor,
        );
      },
    );
  }
}
