import 'package:flutter/material.dart';
import 'package:laundryapp/constants/text.dart';

import '../../widgets/custom_app_bard.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Cart', showLeading: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text('Total Clothes', style: kBodyTextStyleGrey),
                Text('8 selected', style: kBodyTextStyleGrey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
