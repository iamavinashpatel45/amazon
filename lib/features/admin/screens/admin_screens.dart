import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/admin/screens/addproduct.dart';
import 'package:flutter/material.dart';

class admin_screen extends StatefulWidget {
  const admin_screen({super.key});

  @override
  State<admin_screen> createState() => _admin_screenState();
}

class _admin_screenState extends State<admin_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: global_variables.appBarGradient,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/amazon_in.png",
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
                const Text(
                  "Admin",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          "Products",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const addproduct()));
        },
        tooltip: "Add a Product",
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
