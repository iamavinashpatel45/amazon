import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class categories extends StatelessWidget {
  const categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemExtent: 78,
        scrollDirection: Axis.horizontal,
        itemCount: global_variables.categoryImages.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    global_variables.categoryImages[index]['image']!,
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              Text(
                global_variables.categoryImages[index]['title']!,
                style: const TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
