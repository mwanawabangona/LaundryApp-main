import 'package:flutter/material.dart';

import '../../constants/text.dart';
import '../../models/product.dart';
import '../../widgets/home/service_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product(name: 'Shirt', price: 15),
    Product(name: 'Trousers', price: 60),
    Product(name: 'Jersey', price: 50),
    Product(name: 'Skirt', price: 20),
    Product(name: 'Sweater', price: 55),
    Product(name: 'Blankets', price: 120),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
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
                image: const DecorationImage(
                    image: AssetImage('assets/images/banner.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('Laundry products', style: kBodyTitleTextStyleGrey),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemBuilder: (context, index) =>
                  ServiceCard(prod: products[index]),
              itemCount: products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}