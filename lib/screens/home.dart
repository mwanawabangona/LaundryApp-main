import 'package:flutter/material.dart';
import 'package:laundryapp/screens/login.dart';
import 'package:laundryapp/services/navigation.dart';

import '../utils/constants.dart';
import '../widgets/app_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 100.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 150.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/cloth_faded.png"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    "assets/images/illustration.png",
                    scale: 1.1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 24.0,
              ),
              decoration: const BoxDecoration(
                color: Constants.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to Laundree!",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(19, 22, 33, 1),
                        ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "This is the first version of our laundry app. Please sign in or create an account below.",
                    style: TextStyle(
                      color: Color.fromRGBO(74, 77, 84, 1),
                      fontSize: 14.0,
                    ),
                  ),
                  AppButton(
                    text: "Log In",
                    type: ButtonType.PLAIN,
                    onPressed: () {
                      Navigation.go(screen: const Login(), context: context);
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  AppButton(
                    text: "Create an Account",
                    type: ButtonType.PRIMARY,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
