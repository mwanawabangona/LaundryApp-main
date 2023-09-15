import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundryapp/providers/products.dart';
import 'package:laundryapp/screens/home.dart';
import 'package:laundryapp/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: (BuildContext context, _) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Products()),
          ],
          child: MaterialApp(
            title: 'Laundry App',
            debugShowCheckedModeBanner: false,
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
            home: const Home(),
          ),
        );
      },
    );
  }
}
