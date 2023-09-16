import 'package:flutter/material.dart';
import 'package:laundryapp/constants/text.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  const CustomButton({
    Key? key,
    required this.btnText,
    required this.click,
    this.isLoading = false,
  }) : super(key: key);

  final String btnText;
  final Function() click;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : click,
      style: ElevatedButton.styleFrom(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: const Size.fromHeight(50),
        backgroundColor: kPrimaryColor,
      ),
      child: Text(
        btnText,
        style: kBodyTextStyleWhite,
      ),
    );
  }
}