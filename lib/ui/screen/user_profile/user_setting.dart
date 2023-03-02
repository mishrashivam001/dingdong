import 'package:ding_dong/core/constant/app_colors.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../controller/view_models/settings_view_model.dart';
import '../../../core/router/assets_route.dart';
import '../../../generated/l10n.dart';
import '../base_view.dart';

class UserSetting extends StatelessWidget{
   UserSetting({super.key});

  final TextEditingController _numberController = TextEditingController();
   // RangeValues _values = const RangeValues(1, 100);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            AssetsPath.userBack,
            height: 8.w,
          ),
        ),
        title: Text(S.current.ued_setting),
      ),
      body: SingleChildScrollView(child: _buildSettingsContent(),),
    ));
  }

  Widget _buildSettingsContent(){
    return BaseStatefulView<SettingsViewModel>(loadOnInit: (model) {
      model.init();
    }, builder: (context, model, child) {
      if (model.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Padding(
      padding:  EdgeInsets.only(left: 5.w,right: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.w,),
        _buildPremiumRow(S.current.ued_gold, AppColors.codeGold),
        SizedBox(height:5.w),
        _buildPremiumRow(S.current.ued_platinum, AppColors.codePlatinum),
          SizedBox(height: 6.w,),
          _buildTitleText(S.current.uie_acc),
          SizedBox(height: 3.w,),
          _buildAccountSetting(),
          SizedBox(height: 4.w,),
          _buildTitleText(S.current.uie_lang),
          SizedBox(height: 4.w,),
          _buildDropDown(model),
          SizedBox(height: 3.w,),
          _buildTitleText(S.current.uie_max_dis),
          SizedBox(height: 3.w,),
          Container(
            padding: EdgeInsets.only(top: 3.w,left: 2.w,right: 2.w,bottom: 3.w),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 0.4.w),
                borderRadius: BorderRadius.all(Radius.circular(3.w))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:EdgeInsets.only(left:5.w),
                  child: Text("25 kilometers",style: TextStyle(fontSize: 12.sp),),
                ),
                RangeSlider(
                  values: model.distanceRange,
                  activeColor: AppColors.iconTopColor,
                  inactiveColor: Colors.grey.withOpacity(0.6),
                  onChanged: (RangeValues values) {
                    model.setDistance(values);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 3.w,),
          _buildTitleText(S.current.uie_age),
          SizedBox(height: 3.w,),
      Container(
        padding: EdgeInsets.only(top: 3.w,left: 2.w,right: 2.w,bottom: 3.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 0.4.w),
          borderRadius: BorderRadius.all(Radius.circular(3.w))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:EdgeInsets.only(left:5.w),
              child: Text("25 year",style: TextStyle(fontSize: 12.sp),),
            ),
            RangeSlider(
              values: model.ageRange,
              divisions: 100,
              // labels: model.ageRange.round(),
              activeColor: AppColors.iconTopColor,
              inactiveColor: Colors.grey.withOpacity(0.6),
              onChanged: (RangeValues values) {
                  model.setAge(values);
              },
            ),
          ],
        ),
      ),

          SizedBox(height: 3.w,),
          _buildTitleText(S.current.uie_noti),
          SizedBox(height: 3.w,),
          _buildTitleText(S.current.uie_payment),
          SizedBox(height: 3.w,),
          _buildTitleText(S.current.uie_privacy),
          SizedBox(height: 3.w,),
          _buildTitleText(S.current.uie_legal),
          SizedBox(height: 3.w,),
          _buildTitleText(S.current.uie_contact_us),
          SizedBox(height: 3.w,),
          _buildTitleText(S.current.uie_log_out),
          SizedBox(height: 3.w,),
          _buildTitleText(S.current.uie_dlt_acc),
          SizedBox(height: 5.w,),
      ],),
    );});
  }

  Widget _buildPremiumRow(String text,Color color){
    return Container(
      padding: EdgeInsets.only(top: 5.5.w,left: 5.w,right: 5.w,bottom: 5.5.w),
      decoration: BoxDecoration(
        color: AppColors.darkSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(3.5.w))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        SvgPicture.asset(AssetsPath.getLogo,height: 2.h,width: 30.w,),
        const Spacer(),
        Text(text.toUpperCase(),style: TextStyle(fontSize: 13.sp,color:color,fontWeight: FontWeight.bold),),
      ],),
    );
  }

  Widget _buildDropDown(SettingsViewModel model) {
    if (model.selectLanguage == null) {
      return const SizedBox.shrink();
    }
    return Container(
      // margin: EdgeInsets.only(left: 5.w, right: 5.w),
      height: 12.w,
      padding: EdgeInsets.only(left: 3.w, right: 3.w),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey,width: 0.3.w),
        borderRadius: BorderRadius.all(Radius.circular(2.w)),
      ),
      child: DropdownButton<String>(
        // style: const TextStyle(color: Colors.black),
        underline: const SizedBox.shrink(),
         value: model.selectLanguage,
        isExpanded: true,
        hint: const Text(
          'Select Item',),
        items: model.languageList
            .map((e) => DropdownMenuItem<String>(
          value: e,
          child: Text(e.toUpperCase(),
              ),
        )).toList(),
        onChanged: (String? value) {
          model.setLanguage(value);
          // model.setLoading();
          // _buildCharts(model);
        },
        // dropdownColor: Colors.white,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          // color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildTitleText(String text){
    return Text(text,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold));
  }

  Widget _buildAccountSetting(){
    return Container(
       padding: EdgeInsets.only(left: 5.w,right: 5.w,top: 2.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey,width: 0.5.w),
        borderRadius: BorderRadius.all(Radius.circular(4.w))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text(S.current.uie_phone,style: TextStyle(
           fontWeight: FontWeight.bold,fontSize: 12.sp
         ),),
        SizedBox(height: 1.w,),
        Text(S.current.uie_phone_desc,style: TextStyle(
            color: Colors.grey,fontSize: 7.sp
        ),),
        SizedBox(height: 1.w,),
        Row(children: [
          Text(S.current.uie_number_code,style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 14.sp
          ),),
          SizedBox(width: 1.w,),
          SizedBox(
            width: 40.w,
            child: TextFormField(controller: _numberController,
              keyboardType: TextInputType.phone,
                maxLength: 10,
                style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  counterText: "",
                hintText: "9900998867",
                  border: InputBorder.none
            )),
          ),
          const Spacer(),
          Text(S.current.uie_verify,style: TextStyle(fontSize: 12.sp,color: AppColors.iconBottomColor),)
        ],)

      ],),
    );
  }
}