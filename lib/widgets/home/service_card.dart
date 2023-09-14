import 'package:flutter/material.dart';
import 'package:laundryapp/constants/colors.dart';
import 'package:laundryapp/models/product.dart';
import 'package:laundryapp/providers/products.dart';
import 'package:provider/provider.dart';
import '../../constants/text.dart';

class ServiceCard extends StatelessWidget {
  final Product prod;
  const ServiceCard({super.key, required this.prod});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Provider.of<Products>(context, listen: false).addToCart(prod),
      child: Container(
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
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(prod.name,
                style: kBodyTitleTextStyleGrey.copyWith(color: kPrimaryColor)),
            const SizedBox(height: 5),
            Text('${prod.price} ZMW / piece', style: kBodyTextStyleGrey),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(5.0),
              color: kPrimaryColor,
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Add to Cart',
                style: kBodyTextStyleWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
