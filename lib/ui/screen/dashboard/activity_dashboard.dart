import 'package:ding_dong/core/router/assets_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../dashboard/fragment_matches.dart';
import '../dashboard/fragment_message.dart';
import '../dashboard/fragment_profile.dart';
import '../custom/custom_bottom_nav.dart';
import '../../../generated/l10n.dart';
import '../auth/splash_screen.dart';
import 'fragment_home.dart';


class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyDashboard> {
  int pageIndex = 0;
  final _inactiveColor = Colors.grey;
  final pages = [
     HomeFragment(),
    const MatchesFragment(),
    const MessageFragment(),
    const ProfileFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: _buildBottomBar()
    );
  }

  Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      selectedIndex: pageIndex,
      showElevation: false,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => pageIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          image: SvgPicture.asset(AssetsPath.dashHome ),
          title: Text(S.current.dash_home),
          activeColor: SplashScreen.gradientTopColor,
          textAlign: TextAlign.center,
          // iconColor: Colors.transparent,
        ),
        BottomNavyBarItem(
          image: SvgPicture.asset(AssetsPath.dashMatch),
          title: Text(S.current.mtchs_title),
          activeColor: SplashScreen.gradientTopColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          image: SvgPicture.asset(AssetsPath.dashMessage),
          title: Text(
            S.current.dash_chats,
          ),
          activeColor: SplashScreen.gradientTopColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          image: SvgPicture.asset(AssetsPath.dashProfile),
          title: Text(S.current.dash_prf),
          activeColor: SplashScreen.gradientTopColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
