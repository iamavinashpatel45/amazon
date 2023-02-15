import 'package:flutter/material.dart';

class prouductview extends StatelessWidget {
  final String link;
  final bool isborder;
  final double padding;

  const prouductview(
      {super.key, required this.link, this.isborder = true, this.padding = 15});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: isborder
              ? Border.all(
                  color: Colors.black,
                  width: 1,
                )
              : const Border(),
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
