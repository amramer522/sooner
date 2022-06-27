import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooner/helper/colors.dart';
import 'package:sooner/screens/register/view.dart';
import 'package:sooner/screens/splash/view.dart';
import 'package:sooner/screens/support/view.dart';

import 'screens/home/view.dart';
import 'screens/home_details/view.dart';
import 'screens/login/view.dart';
import 'screens/statuses/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    //   statusBarColor: colorPrimary,
    // ));

    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Sooner',
              theme: ThemeData(
                primarySwatch: buildMaterialColor(0xff2C4893),
                // platform: TargetPlatform.iOS,
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(327.w, 48.h))),
              ),
              home:  SplashScreen(),
              builder: (context, child) =>  Directionality(
                  textDirection: TextDirection.rtl, child: child!),
            )
    );
  }
}
