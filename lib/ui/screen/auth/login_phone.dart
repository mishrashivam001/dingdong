import 'package:ding_dong/controller/provider/theme_provider.dart';
import 'package:ding_dong/core/constant/app_colors.dart';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:ding_dong/core/router/screen_route.dart';
import 'package:ding_dong/data/network/api_services.dart';
import 'package:ding_dong/locator.dart';
import 'package:flutter/material.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../../../generated/l10n.dart';
import 'splash_screen.dart';

class PhoneLogin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  PhoneLogin({super.key});
 String mobNumber = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: SplashScreen.gradientTopColor,
          ),
        ),
        shadowColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.current.login_phone_title,
          style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
      ),
      body: _buildLoginContent(context),
    );
  }

  Widget _buildLoginContent(context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 4.h),
          Image.asset(
            AssetsPath.getPhoneOtp,
            height: 30.h,
            width: 70.w,
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            S.current.phone_code,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11.sp),
          ),
          SizedBox(height: 3.h),
          Container(
            margin: EdgeInsets.only(top: 4.h),
            height: 7.5.h,
            width: 80.w,
            decoration: BoxDecoration(
                border: Border.all(
                    color: SplashScreen.gradientTopColor, width: 0.2.w),
                borderRadius: BorderRadius.all(Radius.circular(4.w))),
            child: Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 2.w),
                  Expanded(
                    child: TextFormField(
                        controller: _controller,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        onChanged: (value) => MyThemePreferences.setMobileNumber(),
                        validator: (value) => _phoneValidator(context),
                        decoration: InputDecoration(
                          // errorText: _login(context).toString(),
                          border: InputBorder.none,
                          counterText: "",
                          labelText: S.current.phone_num,
                          floatingLabelStyle: TextStyle(fontSize: 10.sp, color: SplashScreen.gradientTopColor),
                          labelStyle: const TextStyle(fontSize: 15, color: SplashScreen.gradientTopColor),
                        )),
                  ),
                  ElevatedButton(
                      onPressed: () async{
                        if(_formKey.currentState?.validate()==true){
                          // String number = await MyThemePreferences.setMobileNumber();
                          String? storedValue = await MyThemePreferences.getMobileNumber();
                          print(storedValue);
                          print(_controller.text);
                       final result = await  locator<ApiServices>().loginWithMobile(_controller.text.trim());
                       if(result!=null){
                         _showMessage(context, result);
                       }else if(_controller.text == storedValue){
                         Navigator.pushNamed(context, ScreenRoutes.userDashboard);
                       }
                       else if(_controller.text != storedValue){
                         Navigator.pushNamed(context, ScreenRoutes.verifyLogin,arguments: _controller.text.trim());
                       }
                       return;
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              SplashScreen.gradientTopColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w),))),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 1.3.h, bottom: 1.3.h, right: 1.5.w, left: 1.5.w),
                        child: Text(
                          S.current.started_conti,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                      )),
                  SizedBox(width: 3.w)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showMessage(BuildContext context,String message){
    final snackBar = SnackBar(
      padding:  EdgeInsets.all(3.w),
      content: Text(message,style:
      const TextStyle(color: Colors.white,fontSize: 15,),),
      backgroundColor: (AppColors.iconTopColor),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  final TextEditingController _controller = TextEditingController();

  _phoneValidator(BuildContext context) {
    if (_controller.text.isNotEmpty && _controller.text.length != 10) {
      return "Mobile number is incorrect";
    } else if (_controller.text.isEmpty) {
      return "Field Is Empty!!";
    } else if (_controller.text.isNotEmpty && _controller.text.length == 10) {
      mobNumber = _controller.text;
      return null;
    }
  }
}
