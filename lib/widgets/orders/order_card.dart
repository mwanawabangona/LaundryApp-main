import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text.dart';

Padding getRow(String title, String des) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$title:', style: kBodyTextStyleGrey),
        Text(
          des,
          style: kBodyTextStyleGrey.copyWith(
            color: des.contains('ZMW')
                ? kPrimaryColor
                : des.contains('#')
                    ? Colors.black
                    : null,
            fontWeight: des.contains('ZMW') || des.contains('#')
                ? FontWeight.w800
                : null,
          ),
        ),
      ],
    ),
  );
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.10),
            blurRadius: 4.0,
            offset: const Offset(0.0, 3.0),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          getRow('Order ID', '#10552251'),
          getRow('Order Date', '09-15-2023'),
          getRow('Pick Up', 'Chawama, Plot 451, Zambezi Rd'),
          getRow('Total Amount', 'ZMW 53'),
        ],
      ),
    );
  }
}
