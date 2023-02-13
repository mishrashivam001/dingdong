import 'package:ding_dong/controller/view_models/prf_complete_view_model.dart';
import 'package:ding_dong/controller/view_models/profile_fragment_view_model.dart';
import 'package:ding_dong/core/constant/data.dart';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../auth/splash_screen.dart';
import '../../../generated/l10n.dart';
import '../base_view.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:  IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            AssetsPath.userBack,height: 8.w,
          ),
        ),
        centerTitle: true,
        title: SvgPicture.asset(
          AssetsPath.getLogo,
        ),
      ),
      body: SingleChildScrollView(
        child: BaseStatelessView<ProfileFragmentViewModel>(
          builder: (context, model, child) {
            return _buildProfileContent(context,model.match);
          },),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context,UserProfile user) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 8.w, right: 6.w, left: 6.w),
      child:BaseStatefulView<ProfileFragmentViewModel>(loadOnInit: (model) {
        model.init();
      }, builder: (context, model, child) {
        if (model.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            padding: EdgeInsets.all(0.8.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
                gradient: LinearGradient(
                    tileMode: TileMode.clamp,
                    begin:  Alignment(0.0,1.0),
                    end: Alignment(0.0, -1.0),
                    colors: [SplashScreen.gradientTopColor,SplashScreen.gradientLiveBottomColor]),
              // borderRadius: BorderRadius.all(Radius.circular(50.w))
            ),
            child: Container(
              padding: EdgeInsets.all(1.5.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.all(Radius.circular(50.w))
              ),
              child: CircleAvatar(
                backgroundImage:
                    const NetworkImage('https://picsum.photos/id/237/200/300'),
                radius: 9.h,
              ),
            ),
          ),
          SizedBox(
            height: 4.w,
          ),
          Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                  text: user.name,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,

                      letterSpacing: 2),
                  children: <InlineSpan>[
                    TextSpan(
                      text: user.age.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          letterSpacing: 2),
                    ),
                  ])),
          SizedBox(height: 6.w),
          _buildEdit(),
          SizedBox(height: 8.w),
          _buildBoostContent(),
          SizedBox(height: 10.w),
          _buildDesc(S.current.up_boost, S.current.up_boost_desc, SplashScreen.gradientLiveBottomColor),
          SizedBox(height: 10.w),
          _buildDesc(S.current.up_likes, S.current.up_likes_desc, SplashScreen.gradientMidColor),
          SizedBox(height: 10.w),
          _buildDesc(S.current.up_upgrade, S.current.up_upgrade_desc, SplashScreen.gradientTopColor),
        ],
      );}
    ),);
  }

  Widget _buildEdit() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(1.w))),
          child: SvgPicture.asset(
            AssetsPath.dashEdit,
            height: 2.h,
            width: 8.w,
            color: SplashScreen.gradientTopColor,
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        InkWell(
          onTap: () {},
          child: Text(S.current.up_ed_prf,
              style: TextStyle(
                  fontSize: 11.sp,
                  color: SplashScreen.gradientTopColor,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          width: 5.w,
        ),
        SvgPicture.asset(
          AssetsPath.dashSetting,
          height: 2.h,
          width: 4.w,
          color: Colors.black,
        ),
        SizedBox(
          width: 1.w,
        ),
        InkWell(
          onTap: () {},
          child: Text(S.current.up_setting,
              style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildBoostContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AssetsPath.dashBoost,height:8.h,width:17.w,),
        SizedBox(width: 10.w,),
        SvgPicture.asset(AssetsPath.dashLike,height:8.h,width:17.w,),
        SizedBox(width: 10.w,),
        SvgPicture.asset(AssetsPath.dashFire,height:8.h,width:17.w,),
      ],
    );
  }

  Widget _buildDesc(String title, String desc, Color color){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,style: TextStyle(
          fontSize: 18.sp,
          color: color,
          fontWeight: FontWeight.bold
        ),),

        Text(desc,
          textAlign:TextAlign.center,style: TextStyle(
            fontSize: 12.sp,
            color: color.withOpacity(0.6),
            wordSpacing: 3
        ),)
      ],
    );
  }
}
