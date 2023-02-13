import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httperrorhandle(
    http.Response response, BuildContext context, VoidCallback fun) {
  switch (response.statusCode) {
    case 200:
      fun();
      break;
    case 400:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(jsonDecode(response.body)['msg']),
        ),
      );
      break;
    case 500:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(jsonDecode(response.body)['error']),
        ),
      );
      break;
    default:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.body),
        ),
      );
      break;
  }
}
