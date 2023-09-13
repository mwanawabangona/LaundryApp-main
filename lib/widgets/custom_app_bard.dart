import 'package:flutter/material.dart';
import 'package:laundryapp/constants/colors.dart';
import '../constants/text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeading;

  final List<Widget>? actions;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.showLeading = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showLeading
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.black,
                  ),
                )
              : SizedBox(width: showLeading ? 0 : 10),
          Text(title,
              style: kTitleTextStyle.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              )),
          showLeading
              ? Opacity(
                  opacity: 0.0,
                  child: IconButton(
                    onPressed: () {
                      // Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.black,
                    ),
                  ),
                )
              : SizedBox(width: showLeading ? 0 : 10),
        ],
      ),
      elevation: 0.0,
      actions: actions ?? [],
    );
  }
}
