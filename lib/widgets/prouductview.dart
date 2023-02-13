import 'package:flutter/material.dart';

class prouductview extends StatelessWidget {
  final String link;

  const prouductview({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            link,
            fit: BoxFit.fitHeight,
            width: 200,
          ),
        ),
      ),
    );
  }
}
