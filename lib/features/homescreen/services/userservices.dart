import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class user_services {
  Future<List<Product>> getproduct(
    String category,
    BuildContext context,
  ) async {
    try {
      List<Product> productslist = [];
      Product product = Product(
        name: "",
        description: "",
        quantity: 0.0,
        images: [],
        category: category,
        price: 0.0,
      );
      http.Response res = await http.post(
        Uri.parse("${global_variables.url}/user/get-products"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: product.toJson(),
      );
      for (int i = 0; i < jsonDecode(res.body).length; i++) {
        productslist.add(
          Product.fromJson(
            jsonEncode(
              jsonDecode(res.body)[i],
            ),
          ),
        );
      }
      return productslist;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    return [];
  }
}
