import 'package:flutter/material.dart';
import 'package:laundryapp/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/text.dart';

class ServiceCard extends StatelessWidget {
  final String service;
  const ServiceCard({super.key, required this.service});

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
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            FontAwesomeIcons.plus,
            size: 60,
            color: kPrimaryColor,
          ),
          const SizedBox(height: 10),
          Text(service,
              style: kBodyTitleTextStyleGrey.copyWith(color: kPrimaryColor)),
        ],
      ),
    );
  }
}
