import 'package:ding_dong/controller/view_models/verify_view_models.dart';
import 'package:ding_dong/core/constant/app_colors.dart';
import 'package:ding_dong/core/router/screen_route.dart';
import 'package:flutter/material.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import 'package:pinput/pinput.dart';
import '../base_view.dart';
import 'splash_screen.dart';
import '../../../generated/l10n.dart';

class VerifyLogin extends StatelessWidget {
  final String phoneNumber;
   VerifyLogin({Key? key,required this.phoneNumber}) : super(key: key);

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String code ="";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: SplashScreen.gradientTopColor,
          ),
        ),
        shadowColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          S.current.verify_phone_title,
          style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
      ),
      body:BaseStatelessView<VerifyViewModel>(
        builder: (context, model, child) {
          return _buildLoginContent(context);
        },),
    );
  }

  Widget _buildLoginContent(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: SplashScreen.gradientTopColor),
        borderRadius: BorderRadius.circular(4.w),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: defaultPinTheme.decoration?.copyWith(
        color: SplashScreen.gradientTopColor,
      ),
    );

    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                  text: S.current.vrfy_desc,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold),
                  children: <InlineSpan>[
                    TextSpan(
                      text: phoneNumber,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ])),
          SizedBox(height: 10.h),
          Pinput(
            defaultPinTheme: defaultPinTheme,
            submittedPinTheme: submittedPinTheme,
            validator: (s){
              code = s!;
              s == "2222" ?
              _verify(context):"Pin is incorrect";
              return null;},
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),
          SizedBox(height: 10.h),
          Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                  text: S.current.vrfy_didnt,
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: S.current.vrfy_resend,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ])),

          Text(
            S.current.vrfy_via_call,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.sp),
          ),
          SizedBox(height: 4.h),

          SizedBox(height: 5.h,width: 90.w,
            child: ElevatedButton(
                onPressed: () {
                  _verify(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.iconTopColor),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.w),))),
                child: Text(
                  S.current.vrfy_accnt,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.sp,color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
  _verify(BuildContext context){
    if(code == "2222"){
      Navigator.pushNamed(
          context,
          ScreenRoutes.createProfileDetails
      );
    }else{
      return "Pin is incorrect";
    }
  }
}
