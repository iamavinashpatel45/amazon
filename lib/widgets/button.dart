import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  final Color color;

  const button(
      {Key? key,
      required this.ontap,
      required this.text,
      this.color = global_variables.secondaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: color,
      ),
      child: Text(text),
    );
  }
}
