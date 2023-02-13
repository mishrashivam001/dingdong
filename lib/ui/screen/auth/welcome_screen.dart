import 'package:ding_dong/controller/view_models/wlcmscreen_view_model.dart';
import 'package:ding_dong/core/constant/app_colors.dart';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:ding_dong/core/router/screen_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../base_view.dart';
import 'splash_screen.dart';
import '../../../generated/l10n.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BaseStatelessView<WelcomeViewModel>(
    builder: (context, model, child) {
      return _buildWlcmContent(context);
    },),);
  }
  Widget _buildWlcmContent(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            AssetsPath.getCouple,
            height: 30.h,
            width: 70.w,
          ),
          SizedBox(
            height: 1.h,
          ),
          SvgPicture.asset(
            AssetsPath.getLogo,
            height: 3.h,
            width: 80.w,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            S.current.wlcm_title,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Expanded(
            child: Text.rich(TextSpan(
                text: S.current.wlcm_desc,
                style: TextStyle(fontSize: 11.sp),
                children: <InlineSpan>[
                  TextSpan(
                    text: S.current.wlcm_match,
                    style: TextStyle(
                        fontSize: 11.sp, color: SplashScreen.gradientTopColor),
                  )
                ]),
            textAlign: TextAlign.center,),
          ),
          Container(
            margin: EdgeInsets.only(top: 4.h),
            height: 5.5.h,
            width: 80.w,
            decoration: BoxDecoration(
                border: Border.all(
                    color: SplashScreen.gradientTopColor, width: 0.2.w),
                borderRadius: BorderRadius.all(Radius.circular(4.w))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsPath.getGoogle,
                  height: 3.h,
                  width: 6.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 3.w),
                Text(
                  S.current.wlcm_google,
                  style: TextStyle(fontSize: 10.sp),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(
                context,ScreenRoutes.phoneLogin);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 2.h),
              height: 5.5.h,
              width: 80.w,
              decoration: BoxDecoration(
                  color: AppColors.iconTopColor,
                  borderRadius: BorderRadius.all(Radius.circular(4.w))),

              child: Text(
                S.current.wlcm_phone,
                style: TextStyle(fontSize: 11.sp, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 1.h,),
          Text(
            S.current.wlcm_trouble,
            style: TextStyle(fontSize: 11.sp,
            decoration: TextDecoration.underline,),
          ),
          const Spacer(),

          Expanded(
            child:
          Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
              text: S.current.wlcm_conclusion,
              style: TextStyle(fontSize: 11.sp),
              children: <InlineSpan>[
                TextSpan(
                  text: S.current.wlcm_terms,
                  style: TextStyle(
                      fontSize: 11.sp,decoration: TextDecoration.underline,
                  decorationColor: Colors.grey[700]),
                ),
                TextSpan(
                  text: S.current.wlcm_and,
                  style: TextStyle(
                      fontSize: 11.sp),
                ),
                TextSpan(
                  text: S.current.wlcm_privacy,
                  style: TextStyle(
                      fontSize: 11.sp, decoration: TextDecoration.underline),
                )
              ])),),
          SizedBox(height: 2.h,)
        ],
      ),
    );
  }
}
