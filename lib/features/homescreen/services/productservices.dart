import 'dart:convert';
import 'package:amazon/constants/httperrorhanding.dart';
import 'package:amazon/models/product.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class productsservices {
  void rateproduct(
    double rating,
    BuildContext context,
    Product product,
  ) async {
    try {
      var user = Provider.of<user_provider>(context, listen: false).user;
      http.Response res = await http.post(
        Uri.parse("${global_variables.url}/user/rate-product"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': user.token,
        },
        body: jsonEncode({
          "id": product.id,
          "rating": rating,
        }),
      ); 
      // ignore: use_build_context_synchronously
      httperrorhandle(
        res,
        context,
        () {
          print(res.body);
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
