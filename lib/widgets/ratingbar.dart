import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ratingbar extends StatelessWidget {
  final Product product;
  const ratingbar({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    double rating = 0.0;
    for (int i = 0; i < product.rating!.length; i++) {
      rating += product.rating![i].rating;
    }
    rating = rating / product.rating!.length;
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
