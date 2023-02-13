import 'package:amazon/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class topbuttons extends StatefulWidget {
  const topbuttons({super.key});

  @override
  State<topbuttons> createState() => _topbuttonsState();
}

class _topbuttonsState extends State<topbuttons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            account_buttons(
              text: "Your Order",
              ontap: () {},
            ),
            account_buttons(
              text: "Turn Seller",
              ontap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            account_buttons(
              text: "Log Out",
              ontap: () {},
            ),
            account_buttons(
              text: "Your Wish List",
              ontap: () {},
            ),
          ],
        )
      ],
    );
  }
}
