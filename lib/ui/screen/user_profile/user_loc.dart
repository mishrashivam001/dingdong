import 'package:ding_dong/controller/view_models/user_loc_view_model.dart';
import 'package:ding_dong/core/constant/app_colors.dart';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:ding_dong/core/router/screen_route.dart';
import 'package:flutter/material.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../auth/splash_screen.dart';
import '../../../generated/l10n.dart';
import '../base_view.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading:  IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              AssetsPath.userBack,height: 8.w,
            ),
          ),
        ),
        body: BaseStatelessView<UserLocationViewModel>(
          builder: (context, model, child) {
            return _buildLocContent(context);
          },
        ),
      ),
    );
  }

  Widget _buildLocContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.h),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /*GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                    color: AppColors.iconTopColor,
                  ),
                  child: SvgPicture.asset(
                    AssetsPath.userBack,
                  ),
                ),
              ),*/
              Container(
                  padding: EdgeInsets.only(
                      top: 5.w, left: 5.w, right: 5.w, bottom: 5.w),
                  decoration: BoxDecoration(
                      color: SplashScreen.gradientTopColor.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.w),
                          topRight: Radius.circular(5.w))),
                  height: 23.h,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.current.loc_access,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp)),
                          SizedBox(height: 2.w,),
                          Text(S.current.loc_desc,
                              style: TextStyle(
                                  fontSize: 10.sp)),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(S.current.loc_not,
                                  style: TextStyle(
                                      fontSize: 12.sp)),
                              const Spacer(),
                              SizedBox(
                                height: 5.h,
                                width: 40.w,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, ScreenRoutes.userDashboard);
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                SplashScreen.gradientTopColor),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                        ))),
                                    child: Text(
                                      S.current.started_conti,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.white),
                                    )),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
