import 'package:ding_dong/controller/view_models/prf_complete_view_model.dart';
import 'package:ding_dong/core/constant/data.dart';
import 'package:flutter/material.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../../../generated/l10n.dart';
import '../base_view.dart';
import '../auth/splash_screen.dart';

class ProfileComp extends StatelessWidget {
  const ProfileComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseStatelessView<ProfileCompViewModel>(
        builder: (context, model, child) {
          return _buildCompContent(context, model.userPic);
        },
      ),
    );
  }

  Widget _buildCompContent(BuildContext context ,UserProfile user) {
    return Container(
        margin: EdgeInsets.only(top: 6.h),
        child: BaseStatefulView<ProfileCompViewModel>(loadOnInit: (model) {
          model.init();
        }, builder: (context, model, child) {
          if (model.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.w,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(50.w,20.w),bottomRight: Radius.elliptical(50.w,20.w)),
                  child:
                      Image.asset(user.image,fit: BoxFit.fill,),
                ),
                const Spacer(),
                Text(
                  S.current.ui_set,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3.w),
                Text(
                  S.current.ui_waiting,
                  style: TextStyle(
                      fontSize: 13.sp, color: SplashScreen.gradientTopColor),
                ),
                const Spacer(),
                SizedBox(
                  height: 5.h,
                  width: 90.w,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/user_loc');
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              SplashScreen.gradientTopColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.w),
                          ))),
                      child: Text(
                        S.current.started_conti,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      )),
                ),
                SizedBox(height: 10.w),
              ],
            ),
          );
        }));
  }
}
