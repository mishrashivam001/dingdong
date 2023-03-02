import 'package:ding_dong/core/constant/data.dart';
import 'package:ding_dong/core/router/screen_route.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../controller/view_models/home_fragment_view_model.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/router/assets_route.dart';
import '../../../generated/l10n.dart';
import '../base_view.dart';

class UserEditProfileScreen extends StatelessWidget {
  UserEditProfileScreen({super.key});

  final TextEditingController aboutMeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController interestsController = TextEditingController();
  final TextEditingController livingInController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset(
                  AssetsPath.userBack,
                  height: 8.w,
                ),
              ),
              centerTitle: true,
              title: Text(
                "Edit Profile",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            body: BaseStatelessView<HomeFragmentViewModel>(
                builder: (context, model, child) {
              if (model.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return _buildEditContent(model.imageList[0],context);
            })));
  }

  Widget _buildEditContent(UserImage user,context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2.w,
          ),
          _buildTitle(S.current.ued_media),
          SizedBox(
            height: 3.w,
          ),
          SizedBox(
            height:20.h,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return _buildImageContent(context, user);
                }),
          ),
          SizedBox(
            height: 3.w,
          ),
          _buildButton(S.current.ued_add_media, () => null),
          SizedBox(
            height: 5.w,
          ),
          _buildTitle(S.current.ued_about_me),
          SizedBox(
            height: 3.w,
          ),
          _buildTextFormField(aboutMeController,"Tell people something about yourself"),
          SizedBox(
            height: 5.w,
          ),
          _buildTitle(S.current.ued_name),
          SizedBox(
            height: 3.w,
          ),
          _buildNameTextField(nameController),
          SizedBox(
            height: 5.w,
          ),
          _buildTitle(S.current.ued_college),
          SizedBox(
            height: 2.w,
          ),
          _buildTextFormField(collegeController,"Share your college experience"),
          SizedBox(
            height: 5.w,
          ),
          _buildTitle(S.current.ued_job_title),
          SizedBox(
            height: 3.w,
          ),
          _buildTextFormField(jobTitleController,"Share your profession"),
          SizedBox(
            height: 5.w,
          ),
          _buildTitle(S.current.ued_interest),
          SizedBox(
            height: 3.w,
          ),
          _buildInterestField(interestsController,context,"Type interest here"),
          SizedBox(
            height: 5.w,
          ),
          _buildTitle(S.current.ued_living_in),
          SizedBox(
            height: 3.w,
          ),
          _buildTextFormField(livingInController,"Let us know where you live"),
          SizedBox(
            height: 5.w,
          ),
          _buildTitle(S.current.ued_location),
          SizedBox(
            height: 5.w,
          ),
          _buildButton(S.current.ued_add_city, (){
            Navigator.pushNamed(context, ScreenRoutes.userLocEdit);
          }),
          SizedBox(
            height: 5.w,
          ),
        ],
      ),
    ));
  }

  Widget _buildTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildButton(String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
        decoration: BoxDecoration(
          color: AppColors.iconTopColor,
          borderRadius: BorderRadius.all(Radius.circular(2.w)),
        ),
        child: Center(
          child: Text(
            text,
            style:
                TextStyle(fontSize: 12.sp, color: AppColors.darkSecondaryColor),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller,String text) {
    return TextFormField(
      controller: controller,
      minLines: 1,
      maxLines: 6,
      decoration: InputDecoration(
        hintText: text,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5.w, color: Colors.grey),
            //<-- SEE HERE
            borderRadius: BorderRadius.circular(5.w),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.w)),
              borderSide:
                  BorderSide(color: AppColors.iconTopColor, width: 0.5.w))),
    );
  }

  Widget _buildInterestField(TextEditingController controller,context,String text) {
    return TextFormField(
      controller: controller,
      minLines: 1,
      maxLines: 6,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon:InkWell(onTap:(){
          Navigator.pushNamed(context, ScreenRoutes.userInterestEdit);
        },
            child:Padding(
              padding:  EdgeInsets.all(2.w),
              child: SvgPicture.asset(AssetsPath.userPfForward),
            )) ,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5.w, color: Colors.grey),
            //<-- SEE HERE
            borderRadius: BorderRadius.circular(5.w),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.w)),
              borderSide:
              BorderSide(color: AppColors.iconTopColor, width: 0.5.w))),
    );
  }

  Widget _buildNameTextField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      minLines: 1,
      maxLines: 6,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5.w, color: Colors.grey),
            //<-- SEE HERE
            borderRadius: BorderRadius.circular(5.w),
          ),
          labelText: S.current.ued_full_name,
          labelStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.w)),
              borderSide:
                  BorderSide(color: AppColors.iconTopColor, width: 0.5.w))),
    );
  }

  Widget _buildImageContent(context, UserImage user) {
    return SizedBox(
      // height: 20.h,
      child: Stack(
        // clipBehavior: Clip.none,
        children: <Widget>[
          InkWell(
            onTap: () {
              // model.imageList[index];
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.w)),
              child: Image.asset(
                user.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(bottom: 1.w, left: 1.w),
              padding: EdgeInsets.all(1.w),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.darkSecondaryColor),
              child: SvgPicture.asset(AssetsPath.fltrIcon),
            ),
          ),
        ],
      ),
    );
  }
}
