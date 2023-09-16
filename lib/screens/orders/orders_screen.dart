import 'package:flutter/material.dart';
import 'package:laundryapp/constants/colors.dart';
import 'package:laundryapp/constants/text.dart';

import '../../widgets/orders/order_card.dart';
import '../../widgets/orders/order_tab_btn.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<String> tabs = ['Upcoming', 'Completed', 'Cancelled'];
  String selectedTab = 'Upcoming';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: tabs
                .map(
                  (tab) => InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () => setState(() => selectedTab = tab),
                    child: OrderTabBtn(
                      isActive: tab == selectedTab,
                      tab: tab,
                    ),
                  ),
                )
                .toList(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(),
          ),
          const OrderCard(),
          const SizedBox(height: 15),
          const OrderCard(),
        ],
      ),
    );
  }
}