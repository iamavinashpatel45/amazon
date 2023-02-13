import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/widgets/prouductview.dart';
import 'package:flutter/material.dart';

class orderlist extends StatefulWidget {
  const orderlist({super.key});

  @override
  State<orderlist> createState() => _orderlistState();
}

class _orderlistState extends State<orderlist> {
  List link = [
    "https://rukminim1.flixcart.com/image/416/416/kp5sya80/screen-guard/tempered-glass/o/v/n/apple-macbook-air-m1-13-3-inch-lightwings-original-imag3gh5xftgbpg3.jpeg?q=70",
    "https://rukminim1.flixcart.com/image/416/416/xif0q/mobile/l/8/r/-original-imaghxemnnnkd8bg.jpeg?q=70",
    "https://rukminim1.flixcart.com/image/416/416/kpinwy80/headphone/r/1/q/mwp22hn-a-apple-original-imag3qe9eqkfhmg8.jpeg?q=70",
    "https://rukminim1.flixcart.com/image/416/416/l4hcx3k0/computer/p/p/o/macbook-air-thin-and-light-laptop-apple-original-imagfdfpnjjpdhq2.jpeg?q=70"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Your Orders",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                child: Text(
                  "Sell all",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: global_variables.selectedNavBarColor,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: link.length,
            itemBuilder: (context, index) {
              return prouductview(
                link: link[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
