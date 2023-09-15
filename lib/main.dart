import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundryapp/pages/dashboard.dart';
import 'package:laundryapp/pages/home.dart';
import 'package:laundryapp/pages/login.dart';
import 'package:laundryapp/pages/register_screen.dart';
import 'package:laundryapp/pages/single_order.dart';
import 'package:laundryapp/utils/constants.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Laundry App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          initialRoute: "/splash",
          onGenerateRoute: _onGenerateRoute,
        );
      },
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
    case "/login":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Login();
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Dashboard();
      });
    case "/single-order":
      return MaterialPageRoute(builder: (BuildContext context) {
        return SingleOrder();
      });

    case "/splash":
      return MaterialPageRoute(builder: (BuildContext context) {
        return SplashScreen();
      });

    case "/register":
      return MaterialPageRoute(builder: (BuildContext context) {
        return registerScreen();
      });

    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Image.asset("assets/images/chappa.png"),
            Text(
              "Chappa Laundry",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        nextScreen: Home(),
        splashIconSize: 250,
        splashTransition: SplashTransition.slideTransition,
        duration: 3000,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        animationDuration: Duration(milliseconds: 1000));
  }
}
