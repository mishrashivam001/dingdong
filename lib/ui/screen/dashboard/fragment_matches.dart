import 'package:ding_dong/controller/view_models/match_fragment_view_model.dart';
import 'package:ding_dong/core/constant/data.dart';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../auth/splash_screen.dart';
import '../../../generated/l10n.dart';
import '../base_view.dart';

class MatchesFragment extends StatelessWidget {
  const MatchesFragment({Key? key}) : super(key: key);

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
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AssetsPath.dashNoti))
        ],
      ),
      body: SingleChildScrollView(
        child: _buildMessageContent(context),
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.w, right: 5.w, left: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.w,
          ),
          Text(
            S.current.mtchs_title,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
          SizedBox(
            height: 4.w,
          ),
          Text(
            S.current.mtchs_desc,
            style: TextStyle(
                fontSize: 14.sp, letterSpacing: 1),
          ),
          SizedBox(
            height: 5.w,
          ),
          _buildActivityList(),
        ],
      ),
    );
  }

  Widget _buildActivityList() {
    return BaseStatefulView<MatchFragmentViewModel>(
        loadOnInit: (model) {
          model.init();
        },
      builder: (context, model, child) {
          if(model.loading) {
            return const Center(child: CircularProgressIndicator(),);
          }
        return GridView.builder(
            itemCount: model.matchList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.95, mainAxisSpacing: 2.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return _buildRow(model.matchList[index]);
            });
      }
    );
  }
  Widget _buildRow(User user){
    return Padding(
      padding: EdgeInsets.only(right: 3.w,left: 3.w,top: 1.w,bottom: 1.w),
      child: SizedBox(
        height:19.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(3.w),topRight:Radius.circular(3.w) ),
            child:Image.asset(user.image,fit: BoxFit.cover,height: 13.h,
            ),
          ),
          Container(
            height: 6.h,
            // width: 100.w,
            decoration: BoxDecoration(
                color: SplashScreen.gradientTopColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(3.w),bottomRight: Radius.circular(3.w))
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 2.w,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(TextSpan(
                        text: user.name,
                        style: TextStyle(fontSize: 10.sp, color: Colors.white,fontWeight: FontWeight.bold),
                        children: <InlineSpan>[
                          TextSpan(
                            text: user.age.toString(),
                            style: TextStyle(
                                fontSize: 10.sp, color: Colors.white,fontWeight: FontWeight.bold),
                          )
                        ]),
                      textAlign: TextAlign.center,),

                    Row(children: [
                      SvgPicture.asset(AssetsPath.dashLocation,height: 3.w,width:3.w),
                      SizedBox(width: 1.w,),
                      Text.rich(TextSpan(
                          text: user.city,
                          style: TextStyle(fontSize: 7.sp, color: Colors.white),
                          children: <InlineSpan>[
                            TextSpan(
                              text: user.state,
                              style: TextStyle(
                                  fontSize: 7.sp, color: Colors.white),
                            )
                          ]),
                        textAlign: TextAlign.center,),
                    ],)
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(AssetsPath.dashRemove),
                SizedBox(width: 2.w,)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
