import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text.dart';

class OrderTabBtn extends StatelessWidget {
  final String tab;
  final bool isActive;
  const OrderTabBtn({
    super.key,
    required this.tab,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor.withOpacity(.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(tab,
          style: kBodyTextStyleGrey.copyWith(
              color: isActive ? kPrimaryColor : kGreyColor)),
    );
  }
}