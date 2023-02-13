import 'package:ding_dong/controller/provider/theme_provider.dart';
import 'package:ding_dong/controller/view_models/prf_detail_view_model.dart';
import 'package:ding_dong/core/constant/app_colors.dart';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:ding_dong/core/router/screen_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../auth/splash_screen.dart';
import '../../../generated/l10n.dart';
import '../base_view.dart';

class ProfileDetails extends StatelessWidget {
   ProfileDetails({Key? key}) : super(key: key);

  // final  List<String> genders =[S.current.prf_female,S.current.prf_male,S.current.prf_trans] ;
  //  final  List<String> gendersLike =[S.current.prf_female,S.current.prf_male,S.current.prf_trans] ;
String genderData = '';
String genderLike = '';
  @override
  Widget build(BuildContext context) {
    // print('build called');
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: ()=> Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.iconTopColor,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.current.prf_title,
          style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
      ),
      body: SingleChildScrollView(
        child: BaseStatelessView<ProfileDetailViewModel>(
          builder: (context, model, child) {
            // print('BaseStatelessView build called');
            return _buildLoginContent(context,model);
          },),
      ),
    );
  }

  Widget _buildLoginContent(BuildContext context,ProfileDetailViewModel model) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, right: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.h),
          _buildHeader(),
          SizedBox(height: 2.h),
          TextField(
              autocorrect: true,
              decoration: _inputDecoration.copyWith(
                border: const OutlineInputBorder(),
                labelText: S.current.prf_fst_name,
                labelStyle: const TextStyle(
                  color: AppColors.iconTopColor
                ),
              )),
          SizedBox(height: 2.h),
          TextField(
              autocorrect: true,
              decoration: _inputDecoration.copyWith(
                border: const OutlineInputBorder(),
                labelText: S.current.prf_lst_name,
                labelStyle: const TextStyle(color: AppColors.iconTopColor)
              )),
          SizedBox(height: 2.h),
          Text(
            S.current.prf_gender,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildRadio(model.gender.female, model.selectGenderPosition==0,()=>model.setSelectedGenderIndex(0)),
              _buildRadio(model.gender.male, model.selectGenderPosition==1,()=>model.setSelectedGenderIndex(1)),
              _buildRadio(model.gender.trans, model.selectGenderPosition==2,()=>model.setSelectedGenderIndex(2)),
            ],
          ),
          SizedBox(height: 2.h),
          Text(
            S.current.prf_like,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildRadio(model.genderLike.female, 0==model.selectGenderInterestPosition,()=>model.setSelectedGenderInterestIndex(0)),
              _buildRadio(model.genderLike.male, 1==model.selectGenderInterestPosition,()=>model.setSelectedGenderInterestIndex(1)),
              _buildRadio(model.genderLike.trans, 2==model.selectGenderInterestPosition,()=>model.setSelectedGenderInterestIndex(2)),
            ],
          ),
          SizedBox(height: 2.h),
          SizedBox(
            height: 5.h,
            width: 90.w,
            child: ElevatedButton(
                onPressed: () {
                  MyThemePreferences.saveGender(genderData);
                  Navigator.pushNamed(
                    context,ScreenRoutes.userInterest
                  );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        SplashScreen.gradientTopColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.w),
                    ))),
                child: Text(
                  S.current.started_conti,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.sp, color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 3.h),
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              SizedBox(
                width: 30.w,
                height: 14.h,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 13.h,
                        width: 28.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.w),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                AssetsPath.getCouple,
                                  height: 14.h,
                                  width: 28.w,
                                  fit: BoxFit.fill,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 4.5.h,
                        width: 10.w,
                        padding: EdgeInsets.all(1.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3.h)),
                          color: AppColors.iconTopColor,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: SvgPicture.asset(
                          AssetsPath.userCamera,
                          height: 5.h,
                          width: 5.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



  Widget _buildRadio(String text,bool selected,Function() onSelect){
    return  GestureDetector(
      key: key,
      onTap: (){
        onSelect();
        genderData = text;
      },
      child: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: SplashScreen.gradientTopColor,width: 0.2.w),
            color: selected ? SplashScreen.gradientTopColor : Colors.white
        ),
        child: Text(text, style: TextStyle(color: selected  ? Colors.white : SplashScreen.gradientTopColor, fontSize: 12.sp)),
      ),
    );
  }




  final _inputDecoration = const InputDecoration(
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: AppColors.iconTopColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: AppColors.iconTopColor, width: 1)));
}

class Gender {
  String name;
  Image icon;
  bool isSelected;
  Gender(this.name, this.icon, this.isSelected);
}
