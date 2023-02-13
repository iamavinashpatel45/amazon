import 'package:flutter/material.dart';

class dealoftheday extends StatelessWidget {
  const dealoftheday({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Deal of the day",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Image.network(
          "https://rukminim1.flixcart.com/image/416/416/kp5sya80/screen-guard/tempered-glass/o/v/n/apple-macbook-air-m1-13-3-inch-lightwings-original-imag3gh5xftgbpg3.jpeg?q=70",
        ),
        const SizedBox(
          height: 5,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "\$999.0",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "APPLE 2022 MacBook AIR M2 - (8 GB/256 GB SSD/Mac OS Monterey) MLY13HN/A  (13.6 Inch, Starlight, 1.24 kg)",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Image.network(
                  "https://m.media-amazon.com/images/I/31AQZJ53gnL._AC_SY200_.jpg",
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://m.media-amazon.com/images/I/41AP5QV2M0L._AC_SY200_.jpg",
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://m.media-amazon.com/images/I/310ssdhM1uL._AC_SY200_.jpg",
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://m.media-amazon.com/images/I/312afPe2piL._AC_SY200_.jpg",
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  "https://m.media-amazon.com/images/I/41-7rYUkklL._AC_SY200_.jpg",
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Sell all deals",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
