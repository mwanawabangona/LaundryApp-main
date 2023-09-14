import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundryapp/constants/colors.dart';
import 'package:laundryapp/constants/text.dart';

import '../../widgets/custom_app_bard.dart';
import '../../widgets/home/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart', showLeading: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Total Clothes', style: kBodyTextStyleGrey),
                const Spacer(),
                Text('8 selected',
                    style: kBodyTextStyleGrey.copyWith(color: kPrimaryColor)),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
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
                  const CartCard(),
                  const Divider(),
                  Row(
                    children: [
                      const Text('Sub Total', style: kBodyTextStyleGrey),
                      const Spacer(),
                      Text('ZMW 25',
                          style: kBodyTitleTextStyleGrey.copyWith(
                              fontSize: 13, color: kPrimaryColor)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
