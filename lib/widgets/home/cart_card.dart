import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundryapp/models/product.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/text.dart';
import '../../providers/products.dart';

class CartCard extends StatelessWidget {
  final Product prod;
  const CartCard({super.key, required this.prod});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Icon(
            FontAwesomeIcons.shirt,
            color: kPrimaryColor,
            size: 26,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(prod.name, style: kBodyTextStyleGrey),
              const SizedBox(height: 5),
              Text('ZMW ${prod.price}',
                  style: kBodyTitleTextStyleGrey.copyWith(fontSize: 13)),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () => Provider.of<Products>(context, listen: false)
                .changeQty(prod, true),
            child: const Icon(
              Icons.remove_circle_rounded,
              color: kPrimaryColor,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('${prod.qty}', style: kBodyTitleTextStyleGrey),
          ),
          InkWell(
            onTap: () => Provider.of<Products>(context, listen: false)
                .changeQty(prod, false),
            child: const Icon(
              Icons.add_circle_rounded,
              color: kPrimaryColor,
              size: 30,
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () => Provider.of<Products>(context, listen: false)
                .removeItemfromCart(prod),
            child: const Icon(
              FontAwesomeIcons.trash,
              color: Colors.red,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}