import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class circularwidget extends StatelessWidget {
  const circularwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: global_variables.secondaryColor,
    );
  }
}
