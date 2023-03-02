import 'package:ding_dong/controller/view_models/home_fragment_view_model.dart';
import 'package:ding_dong/core/constant/app_colors.dart';
import 'package:ding_dong/core/constant/data.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import 'package:ding_dong/ui/screen/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/router/assets_route.dart';
import '../../../generated/l10n.dart';

class UserLocationEdit extends StatelessWidget{
   UserLocationEdit({super.key});

  final TextEditingController _locController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BaseStatelessView<HomeFragmentViewModel>(builder: (context,model,child){
          return _buildLocContent(model.imageList[1],context);
        },),
      ),
    );
  }

  Widget _buildLocContent(UserImage user,context){
    return SingleChildScrollView(
      child:Column(
        children: [
          Stack(
            // clipBehavior: Clip.none,
            children: <Widget>[
              InkWell(
                onTap: () {
                  // model.imageList[index];
                },
                child: Image.asset(
                  AssetsPath.userImage,
                  height: 65.h,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 7.w, left: 5.w),
                padding: EdgeInsets.all(1.w),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset(
                    AssetsPath.userBack,
                    height: 8.w,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height:7.w),
          _buildLocDetails(),
        ],
      ),
    );
  }

  Widget _buildLocDetails(){
    return Padding(
      padding:  EdgeInsets.only(left: 5.w,right: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.current.ued_location,style: TextStyle(
            fontSize: 14.sp,
          ),),
          SizedBox(height:3.w),
          TextFormField(
            controller: _locController,
            minLines: 1,
            maxLines: 6,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5.w, color: Colors.grey),
                  //<-- SEE HERE
                  borderRadius: BorderRadius.circular(5.w),
                ),
                prefixIcon: const Icon(Icons.search) ,
                labelText: S.current.ued_loc_city,
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.w)),
                    borderSide:
                    BorderSide(color: AppColors.iconTopColor, width: 0.5.w))),
          ),
          SizedBox(height: 4.w,),
          Container(
            padding: EdgeInsets.only(top: 4.w,bottom: 4.w),
            decoration: BoxDecoration(
              color: AppColors.iconTopColor,
              borderRadius: BorderRadius.all(Radius.circular(5.w))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5.w,),
                SvgPicture.asset(AssetsPath.userPfDontLoc,height: 3.h,width: 10.w,color: AppColors.darkSecondaryColor,),
                SizedBox(width: 3.w,),
                Text(S.current.ued_near,style: TextStyle(
                  fontSize: 12.sp
                ),),
              ],
            ),
          ),

          SizedBox(height: 4.w,),
          Container(
            padding: EdgeInsets.only(top: 4.w,bottom: 4.w),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 0.5.w),
                borderRadius: BorderRadius.all(Radius.circular(5.w))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5.w,),
                SvgPicture.asset(AssetsPath.userPfDontLoc,height: 3.h,width: 10.w,),
                SizedBox(width: 3.w,),
                Text(S.current.ued_dont_show_loc,style: TextStyle(
                  color: Colors.grey,
                    fontSize: 12.sp
                ),),
              ],
            ),
          ),

          SizedBox(height: 7.w,),
        ],
      ),
    );
  }

}