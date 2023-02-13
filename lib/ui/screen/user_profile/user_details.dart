import 'package:ding_dong/controller/view_models/user_detail_view_model.dart';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../auth/splash_screen.dart';
import '../base_view.dart';
import '../dashboard/its_match.dart';
import '../../../generated/l10n.dart';



class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  UserInfoState createState() => UserInfoState();
}

class UserInfoState extends State<UserInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child:SingleChildScrollView(
         child: BaseStatelessView<UserDetailsViewModel>(
            builder: (context, model, child) {
              return Column(children: [
                _buildHeader(),
                _buildInfo(),
                _buildInterests(),
                _buildGallery(),
              ],);
            },),
        ),)
    );
  }
  Widget _buildHeader(){
    return Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(AssetsPath.userImage)
    )
    ),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(AssetsPath.dashBack,color: SplashScreen.gradientTopColor,),
        ),

        SizedBox(height: 35.h,),

        SizedBox(height: 23.w,
          child: Stack(
              children: <Widget>[
                Container(
                  margin:EdgeInsets.only(top: 10.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                ),
                Column(
                    children: <Widget>[

                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(width:4.w),
                            Image.asset(AssetsPath.dashCutCircle,height: 20.w,width:20.w,),
                            Image.asset(AssetsPath.dashBoostCircle,height: 20.w,width:20.w,),
                            InkWell(
                              onTap: (){
                                Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                                  builder: (_) => const MatchScreen(),
                                ),
                                );
                              },
                                child: Image.asset(AssetsPath.dashLove,height: 20.w,width:20.w,)),
                            SizedBox(width:4.w),
                          ]
                      ),
                    ]
                ),
              ]
          ),
        ),
      ],
    ),);
  }
  Widget _buildInfo(){
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(left: 3.w,right: 3.w),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 3.w),
          Text.rich(TextSpan(
              text: S.current.up_name,
              style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),
              children: <InlineSpan>[
                TextSpan(
                  text: S.current.up_age,
                  style: TextStyle(
                      fontSize: 16.sp),
                )
              ]),
            textAlign: TextAlign.start,),
          SizedBox(height: 2.w,),
          Text(S.current.up_profession,
              style: TextStyle(fontSize: 10.sp),
              textAlign: TextAlign.start),
          SizedBox(height: 5.w,),
          Row(
            children: [
              Text(S.current.flter_loc,
                  style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start),
              const Spacer(),
              SvgPicture.asset(AssetsPath.dashLocation,color:SplashScreen.gradientTopColor),
              SizedBox(width: 1.w,),
              Text(S.current.ud_dis,style: TextStyle(
                fontSize: 12.sp,color:SplashScreen.gradientTopColor
              ),)
            ],
          ),
          SizedBox(height: 2.w,),
          Text.rich(TextSpan(
              text: S.current.up_city,
              style: TextStyle(fontSize: 10.sp),
              children: <InlineSpan>[
                TextSpan(
                  text: S.current.up_state,
                  style: TextStyle(
                      fontSize: 10.sp),
                )
              ]),
            textAlign: TextAlign.start,),
          SizedBox(height: 5.w,),
          Text(S.current.ud_abt,
              style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,),
              textAlign: TextAlign.start),
          SizedBox(height: 2.w,),
          Text(S.current.ud_desc,
              style: TextStyle(letterSpacing:1,fontSize: 10.sp),
              textAlign: TextAlign.start),
          Text(S.current.ud_read,
              style: TextStyle(letterSpacing:1,fontSize: 10.sp, color:SplashScreen.gradientTopColor),
              textAlign: TextAlign.start),
        ],
      ),
    );
  }
  Widget _buildInterests(){
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(left: 3.w,right: 3.w),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.w,),
          Text(S.current.ud_interests,
              style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),
              textAlign: TextAlign.start),

          Wrap(children: [
            InkWell(
              onTap: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const PhoneLogin()),
                );*/
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 1.h),
                height: 4.5.h,
                width: 22.w,
                decoration: BoxDecoration(
                    color: SplashScreen.gradientTopColor,
                    borderRadius: BorderRadius.all(
                        Radius.circular(4.w))),
                child: Text(
                  S.current.prf_female,
                  style: TextStyle(
                      fontSize: 11.sp),
                ),
              ),
            ),

            SizedBox(width: 5.w,),
            InkWell(
              onTap: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const PhoneLogin()),
                );*/
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 1.h),
                height: 4.5.h,
                width: 22.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(4.w)),
                    border: Border.all(
                        color: SplashScreen.gradientTopColor)),
                child: Text(
                  S.current.prf_male,
                  style: TextStyle(
                      fontSize: 11.sp,),
                ),
              ),
            ),
            SizedBox(width: 5.w,),
            InkWell(
              onTap: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const PhoneLogin()),
                );*/
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 1.h),
                height: 4.5.h,
                width: 22.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(4.w)),
                    border: Border.all(
                        color:
                        SplashScreen.gradientTopColor)),
                child: Text(
                  S.current.fltr_both,
                  style: TextStyle(
                      fontSize: 11.sp),
                ),
              ),
            ),
          ],)
        ],
      ),
    );
  }
  Widget _buildGallery(){
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(left: 3.w,right: 3.w,bottom: 3.w),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.w,),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.current.ud_gallery,
                  style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start),

              Text(S.current.ud_see_all,
                  style: TextStyle(fontSize: 14.sp, color: SplashScreen.gradientTopColor),
                  textAlign: TextAlign.start),

            ],
          ),

          SizedBox(height: 3.w,),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 90.w,
                  decoration: BoxDecoration(
                      color: SplashScreen.gradientTopColor.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(5.w))
                  ),
                ),
              ),
              SizedBox(width: 2.w,),
              Expanded(
                child: Column(children: [
                  Container(
                    height: 59.w,
                    decoration: BoxDecoration(
                        color: SplashScreen.gradientTopColor.withOpacity(0.7),
                        borderRadius: BorderRadius.all(Radius.circular(5.w))
                    ),
                  ),

                  SizedBox(height: 2.w,),
                  Container(
                    height: 29.w,
                    decoration: BoxDecoration(
                        color: SplashScreen.gradientTopColor.withOpacity(0.7),
                        borderRadius: BorderRadius.all(Radius.circular(5.w))
                    ),
                  ),
                ],),
              )
            ],
          ),
          SizedBox(height: 2.w,),
          Row(
            children: [
              Expanded(
                child: Column(children: [
                  Container(
                    height: 28.w,
                    decoration: BoxDecoration(
                        color: SplashScreen.gradientTopColor.withOpacity(0.7),
                        borderRadius: BorderRadius.all(Radius.circular(5.w))
                    ),
                  ),
                  SizedBox(height: 2.w,),
                  Container(
                    height: 29.w,
                    decoration: BoxDecoration(
                        color: SplashScreen.gradientTopColor.withOpacity(0.7),
                        borderRadius: BorderRadius.all(Radius.circular(5.w))
                    ),
                  ),
                  SizedBox(height: 2.w,),
                  Container(
                    height: 29.w,
                    decoration: BoxDecoration(
                        color: SplashScreen.gradientTopColor.withOpacity(0.7),
                        borderRadius: BorderRadius.all(Radius.circular(5.w))
                    ),
                  ),
                ],),
              ),
              SizedBox(width: 2.w,),
              Expanded(
                child: Container(
                  height: 90.w,
                  decoration: BoxDecoration(
                      color: SplashScreen.gradientTopColor.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(5.w))
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
