import 'dart:convert';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/constants/httperrorhanding.dart';
import 'package:amazon/models/user.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class auth_service {
  Future<bool> signup(
      String name, String email, String password, BuildContext context) async {
    try {
      User user = User(
        email: email,
        name: name,
        password: password,
        token: "",
        type: "",
        id: "",
        address: "",
      );
      http.Response res = await http.post(
        Uri.parse("${global_variables.url}/api/signup"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httperrorhandle(
        res,
        context,
        () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Acoount Created! Login with this Credentials!"),
            ),
          );
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

  Future<bool> signin(
      String email, String password, BuildContext context) async {
    try {
      User user = User(
        email: email,
        name: "",
        password: password,
        token: "",
        type: "",
        id: "",
        address: "",
      );
      http.Response res = await http.post(
        Uri.parse("${global_variables.url}/api/signin"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httperrorhandle(
        res,
        context,
        () async {
          SharedPreferences write = await SharedPreferences.getInstance();
          await write.setString("auth-token", jsonDecode(res.body)["token"]);
          // ignore: use_build_context_synchronously
          Provider.of<user_provider>(context, listen: false).setuser(res.body);
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
              context, "/maninscreen", (route) => false);
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

  Future<bool> verifytoken(BuildContext context) async {
    try {
      SharedPreferences read = await SharedPreferences.getInstance();
      String? token = read.getString("auth-token");
      if (token != null) {
        var res = await http.post(
          Uri.parse("${global_variables.url}/istokenvalid"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'auth-token': token
          },
        );
        var response = jsonDecode(res.body);
        if (response == true) {
          http.Response res = await http.get(
            Uri.parse("${global_variables.url}/"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'auth-token': token
            },
          );
          // ignore: use_build_context_synchronously
          Provider.of<user_provider>(context, listen: false).setuser(res.body);
        }
      }
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
}
