import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/account/widgets/belowappbar.dart';
import 'package:amazon/features/account/widgets/orderlist.dart';
import 'package:amazon/features/account/widgets/topbuttons.dart';
import 'package:flutter/material.dart';

class account_screen extends StatelessWidget {
  const account_screen({super.key});

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
                Row(
                  children: const [
                    Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          belowappwidget(),
          SizedBox(
            height: 10,
          ),
          topbuttons(),
          SizedBox(
            height: 20,
          ),
          orderlist(),
        ],
      ),
    );
  }
}
