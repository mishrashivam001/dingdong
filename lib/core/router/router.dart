import 'package:ding_dong/core/router/screen_route.dart';
import 'package:ding_dong/ui/screen/auth/login_phone.dart';
import 'package:ding_dong/ui/screen/auth/verify_phone.dart';
import 'package:ding_dong/ui/screen/dashboard/activity_dashboard.dart';
import 'package:ding_dong/ui/screen/dashboard/fragment_home.dart';
import 'package:ding_dong/ui/screen/dashboard/fragment_matches.dart';
import 'package:ding_dong/ui/screen/dashboard/fragment_message.dart';
import 'package:ding_dong/ui/screen/dashboard/fragment_profile.dart';
import 'package:ding_dong/ui/screen/dashboard/its_match.dart';
import 'package:ding_dong/ui/screen/dashboard/user_pics.dart';
import 'package:ding_dong/ui/screen/user_profile/profile_complete.dart';
import 'package:ding_dong/ui/screen/user_profile/profile_details.dart';
import 'package:ding_dong/ui/screen/user_profile/user_chat.dart';
import 'package:ding_dong/ui/screen/user_profile/user_details.dart';
import 'package:ding_dong/ui/screen/user_profile/user_interest.dart';
import 'package:ding_dong/ui/screen/user_profile/user_loc.dart';
import 'package:flutter/material.dart';
import '../../ui/screen/auth/splash_screen.dart';
import '../../ui/screen/auth/welcome_screen.dart';

class Routes {
  static Route generateRoute(RouteSettings settings) {
    final Widget screen;
    switch (settings.name) {

      case ScreenRoutes.splashScreen:
        screen = const SplashScreen();
        break;

      case ScreenRoutes.wlcmScreen:
        screen = const WelcomeScreen();
        break;

      case ScreenRoutes.phoneLogin:
        screen = PhoneLogin();
        break;

      case ScreenRoutes.verifyLogin:
        if(settings.arguments is String){
          screen =  VerifyLogin(phoneNumber: settings.arguments as String,);
        }else{
          screen = _parameterMissing();
        }

        break;

      case ScreenRoutes.createProfileDetails:
        screen =  ProfileDetails();
        break;

      case ScreenRoutes.userInterest:
        screen = UserInterests();
        break;

      case ScreenRoutes.profComp:
        screen = const ProfileComp();
        break;

      case ScreenRoutes.userLoc:
        screen = const UserLocation();
        break;

      case ScreenRoutes.userDashboard:
        screen = const MyDashboard();
        break;

      case ScreenRoutes.chatScreen:
        screen = const MessageFragment();
        break;

      case ScreenRoutes.profileScreen:
        screen = const ProfileFragment();
        break;

      case ScreenRoutes.matchScreen:
        screen = const MatchesFragment();
        break;

      case ScreenRoutes.homeScreen:
        screen =  HomeFragment();
        break;

      case ScreenRoutes.userInfo:
        screen = const UserInfo();
        break;

      case ScreenRoutes.userMatch:
        screen = const MatchScreen();
        break;

      case ScreenRoutes.userPics:
        screen = const UserPics();
        break;

      case ScreenRoutes.userChat:
        screen = UserChatScreen();
        break;

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No routes defined for ${settings.name} yet.'),
            ),
          ),
        );
    }
    return MaterialPageRoute(builder: (context) => screen);
  }

  static Widget _parameterMissing() {
    return const Scaffold(
      body: Center(
        child: Text('Not a valid parameter passed'),
      ),
    );
  }
}
