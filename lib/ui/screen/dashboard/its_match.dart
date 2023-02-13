import 'dart:ffi';
import 'package:ding_dong/controller/view_models/match_screen_view_model.dart';
import 'package:ding_dong/core/constant/app_colors.dart';
import 'package:ding_dong/core/constant/data.dart';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../base_view.dart';
import '../dashboard/activity_dashboard.dart';
import '../auth/splash_screen.dart';
import '../../../generated/l10n.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            AssetsPath.userBack,height: 8.w,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: SvgPicture.asset(
          AssetsPath.getLogo,
        ),
      ),
      body: BaseStatelessView<UserMatchViewModel>(
        builder: (context, model, child) {
          return _buildLoginContent(context, model.partner);
        },
      ),
    );
  }

  Widget _buildLoginContent(BuildContext context, MatchProfile partner) {
    return BaseStatefulView<UserMatchViewModel>(loadOnInit: (model) {
      model.init();
    }, builder: (context, model, child) {
      if (model.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Container(
        margin: EdgeInsets.only(right: 5.w, left: 5.w),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
              width: double.infinity,
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.w),
                            topRight: Radius.circular(10.w),
                            bottomLeft: Radius.circular(10.w)),
                        child: Image.asset(
                          partner.partnerImage,
                          height: 26.h,
                          width: 43.w,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      width: 2.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10.w),
                              topRight: Radius.circular(10.w),
                              bottomLeft: Radius.circular(10.w)),
                          child: Image.asset(
                            partner.userImage,
                            height: 26.h,
                            width: 43.w,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 6.h,
                      width: 10.w,
                      padding: EdgeInsets.only(
                          top: 4.w, left: 1.w, right: 1.w, bottom: 1.w),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.iconTopColor),
                      child: SvgPicture.asset(
                        partner.loveImage,
                        height: 5.h,
                        width: 5.w,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(
              height: 5.w,
            ),
            Text(
              partner.congo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: SplashScreen.gradientTopColor,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2),
            ),
            SizedBox(
              height: 5.w,
            ),
            Text(
              S.current.mtch_it,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: SplashScreen.gradientTopColor,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2),
            ),
            SizedBox(
              height: 1.w,
            ),
            Text(
              S.current.mtch_match,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30.sp,
                  color: SplashScreen.gradientTopColor,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2),
            ),
            SizedBox(
              height: 5.w,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: 10.w, left: 10.w, top: 2.w, bottom: 2.w),
              child: Text(
                partner.desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 7.w,
            ),
            SizedBox(
              width: double.infinity,
              height: 12.w,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          SplashScreen.gradientTopColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.w),
                      ))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 1.3.h, bottom: 1.3.h, right: 1.5.w, left: 1.5.w),
                    child: Text(
                      S.current.mtch_hello,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                  )),
            ),
            SizedBox(
              height: 5.w,
            ),
            SizedBox(
              height: 12.w,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyDashboard()),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.w),
                            side: const BorderSide(
                                color: SplashScreen.gradientTopColor)),
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 1.3.h, bottom: 1.3.h, right: 1.5.w, left: 1.5.w),
                    child: Text(
                      S.current.mtch_swipe,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: SplashScreen.gradientTopColor),
                    ),
                  )),
            ),
          ],
        ),
      );
    });
  }
}
