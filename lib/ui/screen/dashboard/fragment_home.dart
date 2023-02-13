import 'package:ding_dong/controller/view_models/home_fragment_view_model.dart';
import 'package:ding_dong/core/constant/data.dart';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:ding_dong/core/router/screen_route.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../../../core/constant/app_colors.dart';
import '../base_view.dart';
import '../dashboard/its_match.dart';
import '../dashboard/user_pics.dart';
import '../user_profile/user_details.dart';
import '../auth/splash_screen.dart';
import '../../../generated/l10n.dart';
import '../auth/login_phone.dart';

class HomeFragment extends StatelessWidget {
   HomeFragment({Key? key}) : super(key: key);
  int valueHolder = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            AssetsPath.userBack,height: 8.w,
          ),
        ),
        centerTitle: true,
        title: SvgPicture.asset(
          AssetsPath.getLogo,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  shape: const RoundedRectangleBorder( // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return _buildFilter(context);
                  },
                );
              },
              icon: SvgPicture.asset(AssetsPath.dashFilter))
        ],
      ),
      body: Column(
        children: [
          BaseStatelessView<HomeFragmentViewModel>(
            builder: (context, model, child) {
              if (model.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Swiper(
                itemBuilder:(BuildContext context, int index) {
                  return _buildUserImage(context,model.match[index]);
                },
                itemWidth:double.infinity,
                itemHeight:70.h,
                layout: SwiperLayout.TINDER,
                itemCount: model.match.length,
              );
            },
          ),
          _buildIconsRow(context)
        ],
      ),
    );
  }

  Widget _buildFilter(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.w,left: 5.w,top: 5.w),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(width: 5.w,),
              SvgPicture.asset(AssetsPath.userFilter, height: 2.h, width: 5.w),
              const Spacer(),
              Text(
                S.current.fltr_title,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: 3.w,
          ),
          Text(
            S.current.fltr_show,
            style: TextStyle(
              fontSize: 11.sp,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhoneLogin()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 1.h),
                  height: 4.5.h,
                  width: 22.w,
                  decoration: BoxDecoration(
                      color: SplashScreen.gradientTopColor,
                      borderRadius: BorderRadius.all(Radius.circular(4.w))),
                  child: Text(
                    S.current.prf_female,
                    style: TextStyle(fontSize: 11.sp),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhoneLogin()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 1.h),
                  height: 4.5.h,
                  width: 22.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      border: Border.all(color: SplashScreen.gradientTopColor)),
                  child: Text(
                    S.current.prf_male,
                    style: TextStyle(
                        fontSize: 11.sp),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhoneLogin()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 1.h),
                  height: 4.5.h,
                  width: 22.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      border: Border.all(color: SplashScreen.gradientTopColor)),
                  child: Text(
                    S.current.fltr_both,
                    style: TextStyle(fontSize: 11.sp),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.w,
          ),
          SizedBox(
            height: 5.5.h,
            child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: S.current.flter_loc,
                    suffixIcon: const Icon(Icons.location_searching),
                    hintStyle: const TextStyle(
                      color: AppColors.iconTopColor,
                    ),
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color:AppColors.iconTopColor, width: 1),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: SplashScreen.gradientTopColor, width: 1)))),
          ),
          SizedBox(
            height: 5.w,
          ),
          Text(
            S.current.fltr_dis,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
              value: valueHolder.toDouble(),
              min: 1,
              max: 100,
              thumbColor: SplashScreen.gradientTopColor,
              divisions: 100,
              activeColor: SplashScreen.gradientTopColor,
              inactiveColor: Colors.grey,
              label: '${valueHolder.round()}',
              onChanged: (double newValue) {
                /*setState(() {
                                    valueHolder = newValue.round();
                                  });*/
              },
              semanticFormatterCallback: (double newValue) {
                return '${newValue.round()}';
              }),
          Text(
            S.current.fltr_age,
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold),
          ),
          Slider(
              value: valueHolder.toDouble(),
              min: 1,
              max: 100,
              thumbColor: SplashScreen.gradientTopColor,
              divisions: 100,
              activeColor: SplashScreen.gradientTopColor,
              inactiveColor: Colors.grey,
              label: '${valueHolder.round()}',
              onChanged: (double newValue) =>valueHolder = newValue.round(),
              semanticFormatterCallback: (double newValue) {
                return '${newValue.round()}';
              }),
          SizedBox(
            height: 11.w,
            width: 90.w,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(
                    builder: (_) => const MatchScreen(),
                  ));
                },
                style: ButtonStyle(
                    // backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.w),
                          side: const BorderSide(
                              color: SplashScreen.gradientTopColor)),
                    )),
                child: Text(
                  S.current.fltr_reset,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.sp, color: SplashScreen.gradientTopColor),
                )),
          ),
          SizedBox(
            height: 3.w,
          ),
          SizedBox(
            height: 12.w,
            width: 90.w,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(
                  builder: (_) => const MatchScreen(),
                ));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(SplashScreen.gradientTopColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.w),
                    ),
                  )),
              child: Text(
                S.current.fltr_apply,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUserImage(BuildContext context, SelfUser user) {
    return Container(
      margin: EdgeInsets.only(top: 8.w, left: 5.w, right: 5.w),
      child: BaseStatefulView<HomeFragmentViewModel>(loadOnInit: (model) {
        model.init();
      }, builder: (context, model, child) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 65.h,
              child: Stack(
                // clipBehavior: Clip.none,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserPics()),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.w)),
                      child: Image.asset(
                        user.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(
                                    text: user.name,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: user.age.toString(),
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                user.designation,
                                style: TextStyle(
                                    fontSize: 9.sp, color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(AssetsPath.dashLocation,
                                      height: 4.w, width: 4.w),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                        text: user.city,
                                        style: TextStyle(
                                            fontSize: 9.sp,
                                            color: Colors.white),
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text: user.state,
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Colors.white),
                                          )
                                        ]),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UserInfo()));
                              },
                              child: SvgPicture.asset(AssetsPath.dashInfo)),
                          SizedBox(
                            width: 2.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      DotsIndicator(
                        dotsCount: 5,
                        position: 1,
                        decorator: DotsDecorator(
                          size: Size(12.w, 2.w),
                          activeSize: Size(12.w, 2.w),
                          shapes: [
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ],
                          activeShapes: [
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 7.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // _buildIconsRow(context),
          ],
        );
      }),
    );
  }

  Widget _buildIconsRow(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        width: 3.w,
      ),
      Image.asset(
        AssetsPath.dashCutCircle,
        height: 20.w,
        width: 20.w,
      ),
      Image.asset(
        AssetsPath.dashBoostCircle,
        height: 20.w,
        width: 20.w,
      ),
      InkWell(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pushNamed(ScreenRoutes.userMatch);
          },
          child: Image.asset(
            AssetsPath.dashLove,
            height: 20.w,
            width: 20.w,
          )),
      SizedBox(
        width: 3.w,
      ),
    ]);
  }
}
