import 'package:flutter/material.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../auth/splash_screen.dart';

class CustomRadio{
  final int key;
  final String text;
  final Function(bool) onChanged;
  final bool isSelect;

  const CustomRadio({
    required this.key,
    required this.text,
    required this.onChanged,
    required this.isSelect
  });
}


class RadioModel extends StatelessWidget{
  final CustomRadio _item;
  const RadioModel(this._item, {super.key});
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        key: key,
        onTap: (){
          _item.onChanged(!_item.isSelect);
        },
        child: Container(
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: SplashScreen.gradientTopColor,width: 0.5.w),
              color: _item.isSelect ? SplashScreen.gradientTopColor : Colors.white
          ),
          child: Text(_item.text, style: TextStyle(color: _item.isSelect ? Colors.white : SplashScreen.gradientTopColor, fontSize: 12.sp)),
        ),
      );
  }
}
