import 'package:ding_dong/core/router/assets_route.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/l10n.dart';



class StartedScreen extends StatelessWidget {
  const StartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:_buildGetStarted1()
    );
  }

  Widget _buildGetStarted1(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 1.h,),
        Image.asset(AssetsPath.getImage1,height: 65.h,width: 80.w,),
        SizedBox(height: 1.h,),
        Text(S.current.started_desc_1,style: TextStyle(
          fontSize: 12.sp,color: Colors.black
        ),),
        SizedBox(height:1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.current.started_skp,style: TextStyle(
              fontSize: 12.sp,color: Colors.black
            ),),
            Container(
              height: 3.h,
              width: 20.w,
              decoration: BoxDecoration(
                color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(5.w))
            ),
            child: Text(S.current.started_nxt,style: TextStyle(
              fontSize: 12.sp,color: Colors.white
            ),),)
        ],)
      ],
    );
  }
}
