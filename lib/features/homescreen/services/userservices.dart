import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/models/product.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

class user_services {
  Future<List<Product>> getproduct(
    String category,
    BuildContext context,
  ) async {
    try {
      var user = Provider.of<user_provider>(context, listen: false).user;
      List<Product> productslist = [];
      http.Response res = await http.get(
        Uri.parse(
            "${global_variables.url}/user/get-products?category=$category"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': user.token,
        },
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
      return [];
    }
  }
}
