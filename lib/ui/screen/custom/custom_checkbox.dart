import 'package:flutter/material.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../auth/splash_screen.dart';

class CustomCheckbox extends StatelessWidget {
  final Function(bool) onChange;
  final bool isChecked;
  final double? textSize;
  final String text;
  final Color? selectedTextColor, borderColor, selectedBgColor;

  const CustomCheckbox(
      {super.key, required this.isChecked,
      required this.onChange,
      this.textSize,
      required this.text,
      this.selectedBgColor,
      this.selectedTextColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onChange(!isChecked);
        },
        child: AnimatedContainer(
          margin: EdgeInsets.only(top: 1.w,right:1.5.w,left: 1.5.w,bottom: 1.w),
           padding:  EdgeInsets.only(top:2.5.w,bottom: 2.5.w,left: 4.w,right: 4.w),
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
              color: isChecked
                  ? selectedBgColor ?? SplashScreen.gradientTopColor
                  : null,
              borderRadius: BorderRadius.circular(3.w),
              border: Border.all(
                color: borderColor ?? SplashScreen.gradientTopColor,
                width: 0.2.w,
              ),),
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize??12.sp,
              color: isChecked
                  ? selectedTextColor ?? Colors.white
                  : null,
            ),
          ),
        ));
  }
}
