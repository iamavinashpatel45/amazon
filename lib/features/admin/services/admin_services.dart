import 'dart:convert';
import 'dart:io';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/constants/httperrorhanding.dart';
import 'package:amazon/models/product.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class admin_services {
  Future<bool> addproduct(
    BuildContext context,
    String name,
    String description,
    String category,
    double price,
    double quantity,
    List<File> images,
  ) async {
    try {
      var user = Provider.of<user_provider>(context, listen: false).user;
      final cloudinary = CloudinaryPublic("dabxbdh8k", "zurw6cwy");
      List<String> imageurls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            images[i].path,
            folder: name,
          ),
        );
        imageurls.add(res.secureUrl);
      }
      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageurls,
        category: category,
        price: price,
      );
      http.Response res = await http.post(
        Uri.parse("${global_variables.url}/admin/add-product"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': user.token,
        },
        body: product.toJson(),
      );
      // ignore: use_build_context_synchronously
      httperrorhandle(
        res,
        context,
        () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Product Added Successfully!"),
            ),
          );
          Navigator.pop(context);
        },
      );
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      return false;
    }
  }

  Future<List<Product>> getproducts(
    BuildContext context,
  ) async {
    try {
      List<Product> productslist = [];
      http.Response res = await http.post(
        Uri.parse("${global_variables.url}/admin/get-products"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
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

  void deleteproduct(
    BuildContext context,
    Product product,
    VoidCallback onsuccess,
  ) async {
    try {
      http.Response res = await http.post(
        Uri.parse("${global_variables.url}/admin/delete-product"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: product.toJson(),
      );
      // ignore: use_build_context_synchronously
      httperrorhandle(
        res,
        context,
        () {
          onsuccess();
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
