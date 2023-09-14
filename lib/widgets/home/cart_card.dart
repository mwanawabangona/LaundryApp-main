import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/colors.dart';
import '../../constants/text.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
  });

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
              const Text('Jeans', style: kBodyTextStyleGrey),
              const SizedBox(height: 5),
              Text('ZMW 25',
                  style: kBodyTitleTextStyleGrey.copyWith(fontSize: 13)),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.remove_circle_rounded,
              color: kPrimaryColor,
              size: 30,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('3', style: kBodyTitleTextStyleGrey),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.add_circle_rounded,
              color: kPrimaryColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
