import 'package:ding_dong/controller/view_models/user_pics_view_model.dart';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:ding_dong/core/router/screen_route.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../base_view.dart';
import '../dashboard/fragment_home.dart';
import '../auth/splash_screen.dart';

class UserPics extends StatelessWidget {
  const UserPics({Key? key}) : super(key: key);
  final int valueHolder = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BaseStatelessView<UserPicViewModel>(
      builder: (context, model, child) {
        return _buildUserImage(context);
      },),);
  }


  Widget _buildUserImage(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            // clipBehavior: Clip.none,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(
                    context,ScreenRoutes.homeScreen
                  );
                },
                child: SizedBox(
                  height: 85.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.w),
                        bottomRight: Radius.circular(5.w)),
                    child: Image.asset(
                      AssetsPath.userImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.w),
                child: GestureDetector(
                  onTap: ()=> Navigator.pop(context),
                  child: SvgPicture.asset(
                    AssetsPath.dashBack,
                    height: 5.w,
                    width: 5.w,
                    color: SplashScreen.gradientTopColor,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 2.w),
          _buildDotsIndicator()
        ],
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return DotsIndicator(
      dotsCount: 5,
      position: 1,
      decorator: DotsDecorator(
        size: Size(12.w, 2.w),
        activeSize: Size(12.w, 2.w),
        shapes: [
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.w),
          ),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ],
        activeShapes: [
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ],
      ),
    );
  }
}
