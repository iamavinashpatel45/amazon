import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/models/product.dart';
import 'package:amazon/widgets/prouductview.dart';
import 'package:amazon/widgets/ratingbar.dart';
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

class searchproductview extends StatelessWidget {
  final Product product;
  final String query;

  const searchproductview(
      {super.key, required this.product, required this.query});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: prouductview(
            link: product.images[0],
            isborder: false,
            padding: 5,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              SubstringHighlight(
                text: product.name,
                term: query,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textStyleHighlight: const TextStyle(
                  color: Colors.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Text(
              //   product.name,
              //   overflow: TextOverflow.ellipsis,
              //   maxLines: 2,
              // style: const TextStyle(
              //   fontSize: 16,
              //   fontWeight: FontWeight.w400,
              // ),
              // ),
              const SizedBox(
                height: 5,
              ),
              ratingbar(
                rating: double.parse(product.images.length.toString()),
              ),
              Text(
                "\$${product.price}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                "Eligible for FREE Shiping",
              ),
              const Text(
                "In Stock",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
