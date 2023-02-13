import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class belowappwidget extends StatelessWidget {
  const belowappwidget({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<user_provider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: global_variables.appBarGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Row(
          children: [
            const SizedBox(
              width: 25,
            ),
            RichText(
              text: TextSpan(
                text: "Hello, ",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: user.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
