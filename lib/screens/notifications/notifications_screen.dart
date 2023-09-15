import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundryapp/constants/colors.dart';
import 'package:laundryapp/constants/text.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [23548, 15431, 5454]
          .map(
            (e) => InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 6.0),
                        child: Icon(
                          FontAwesomeIcons.boxOpen,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Order Confirmed',
                              style: kBodyTextStyleGrey.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '12/03/2021 0956',
                              style: kBodyTextStyleGrey,
                            ),
                          ],
                        ),
                        Text(
                          'Your order #$e has been confirmed',
                          style: kBodyTextStyleGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
