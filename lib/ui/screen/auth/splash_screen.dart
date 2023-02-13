import 'dart:async';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import 'package:ding_dong/ui/screen/dashboard/activity_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'welcome_screen.dart';
import '../../../generated/l10n.dart';

class SplashScreen extends StatelessWidget {
  static const Color gradientTopColor = Color(0xFFFF0F5E);
  static const Color gradientLiveBottomColor = Color(0xFF5C17E6);
  static const Color gradientMidColor = Color(0xFFC951E7);

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    // PhoneLogin()
                    const WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.1,
            0.9,
          ],
          colors: [
            SplashScreen.gradientTopColor,
            SplashScreen.gradientLiveBottomColor,
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              AssetsPath.getSplashLogo,
              height: 30.w,
              width: 20.w,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              S.current.app_desc,
              style: TextStyle(fontSize: 12.sp, color: Colors.white),
            ),
            const Spacer(),
            Text(
              "DINGdONG",
              style: TextStyle(fontSize: 12.sp, color: Colors.white),
            ),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
      ),
    );
  }
}
