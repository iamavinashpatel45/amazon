import 'package:flutter/material.dart';

class textformfield extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final TextInputType keybordtype;
  final int maxline;

  const textformfield({
    super.key,
    required this.controller,
    required this.hinttext,
    this.maxline = 1,
    this.keybordtype = TextInputType.multiline,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keybordtype,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter $hinttext";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hinttext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black54,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black54,
          ),
        ),
      ),
      maxLines: maxline,
    );
  }
}
