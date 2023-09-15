import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundryapp/constants/text.dart';
import 'package:laundryapp/providers/products.dart';
import 'package:laundryapp/screens/home/cart_screen.dart';
import 'package:laundryapp/screens/orders/orders_screen.dart';
import 'package:laundryapp/services/navigation.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../widgets/custom_app_bard.dart';
import 'home/home_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with TickerProviderStateMixin {
  TabController? tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  String getName() {
    if (_currentIndex == 0) {
      return 'Home';
    } else if (_currentIndex == 1) {
      return 'Orders';
    } else if (_currentIndex == 2) {
      return 'Notifications';
    } else {
      return 'Profile';
    }
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: getName(), actions: [
        IconButton(
            onPressed: () =>
                Navigation.go(screen: const CartScreen(), context: context),
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(
                    FontAwesomeIcons.cartShopping,
                    color: kPrimaryColor,
                  ),
                  Consumer<Products>(
                    builder: (_, val, __) => Visibility(
                      visible: val.cartItems.isNotEmpty,
                      child: Positioned(
                        top: -10,
                        right: -10,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Text(val.totalClothes.toString(),
                              style: kBodyTextStyleWhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ]),
      body: SafeArea(
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            HomeScreen(),
            OrdersScreen(),
            Center(child: Text('hello world', style: kBodyTextStyleGrey)),
            Center(child: Text('hello world', style: kBodyTextStyleGrey)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            tabController!.index = _currentIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        unselectedIconTheme: const IconThemeData(color: kGreyColor),
        unselectedItemColor: kGreyColor,
        selectedLabelStyle: kBodyTextStyleGrey,
        unselectedLabelStyle: kBodyTextStyleGrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.receipt),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidBell),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userLarge),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
