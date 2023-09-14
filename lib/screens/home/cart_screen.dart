import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundryapp/constants/colors.dart';
import 'package:laundryapp/constants/text.dart';
import 'package:laundryapp/models/product.dart';
import 'package:laundryapp/providers/products.dart';
import 'package:laundryapp/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_app_bard.dart';
import '../../widgets/home/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cart',
        showLeading: true,
        actions: [
          IconButton(
              onPressed: () =>
                  Provider.of<Products>(context, listen: false).clearCart(),
              icon: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.redAccent,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Consumer<Products>(
          builder: (_, value, __) => Column(
            children: [
              Visibility(
                visible: value.cartItems.isNotEmpty,
                child: Row(
                  children: [
                    const Text('Total Garments', style: kBodyTextStyleGrey),
                    const Spacer(),
                    Text('${value.totalClothes} selected',
                        style:
                            kBodyTextStyleGrey.copyWith(color: kPrimaryColor)),
                  ],
                ),
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
                    value.cartItems.isNotEmpty
                        ? ListView.separated(
                            itemBuilder: (_, i) =>
                                CartCard(prod: value.cartItems[i]),
                            separatorBuilder: (_, __) => Container(
                                color: kGreyColor.withOpacity(.15), height: 1),
                            itemCount: value.cartItems.length,
                            shrinkWrap: true,
                          )
                        : const Text(
                            'You have not added any products to the cart',
                            style: kBodyTextStyleGrey,
                            textAlign: TextAlign.center,
                          ),
                    const Divider(),
                    Visibility(
                      visible: value.cartItems.isNotEmpty,
                      child: Row(
                        children: [
                          const Text('Total', style: kBodyTextStyleGrey),
                          const Spacer(),
                          Text('ZMW ${value.total}',
                              style: kBodyTitleTextStyleGrey.copyWith(
                                  fontSize: 13, color: kPrimaryColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Visibility(
                visible: value.cartItems.isNotEmpty,
                child: CustomButton(btnText: 'Order', click: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
