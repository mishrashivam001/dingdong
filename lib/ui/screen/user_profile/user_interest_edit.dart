import 'package:ding_dong/core/router/assets_route.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../controller/view_models/user_interest_view_model.dart';
import '../../../core/constant/app_colors.dart';
import '../../../generated/l10n.dart';
import '../base_view.dart';
import '../custom/custom_checkbox.dart';

class UserInterestEditScreen extends StatelessWidget {
  UserInterestEditScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            AssetsPath.userBack,
            height: 8.w,
          ),
        ),
        title: Row(
          children: [
            Text(S.current.ued_interest),
            const Spacer(),
            Text(
              S.current.uie_count,
              style: TextStyle(fontSize: 13.sp),
            ),
            SizedBox(
              width: 1.w,
            ),
            Text(
              S.current.uie_out,
              style: TextStyle(fontSize: 13.sp),
            ),
            SizedBox(
              width: 1.w,
            ),
            Text(
              S.current.uie_max_count,
              style: TextStyle(fontSize: 13.sp),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(child: _buildInterestContent()),
    ));
  }

  Widget _buildInterestContent() {
    return Padding(
      padding: EdgeInsets.only(right: 5.w, left: 5.w),
      child: Column(
        children: [
          SizedBox(
            height: 5.w,
          ),
          TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 0.5.w, color: AppColors.iconTopColor),
                  //<-- SEE HERE
                  borderRadius: BorderRadius.circular(5.w),
                ),
                prefixIcon: const Icon(Icons.search),
                labelText: S.current.ued_loc_city,
                labelStyle: const TextStyle(color: AppColors.iconTopColor),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.w)),
                    borderSide: BorderSide(
                        color: AppColors.iconTopColor, width: 0.5.w))),
          ),
          SizedBox(
            height: 5.w,
          ),
          _buildInterests(),
        ],
      ),
    );
  }

  Widget _buildInterests() {
    return BaseStatefulView<UserInterestViewModel>(loadOnInit: (model) {
      model.init();
    }, builder: (context, model, child) {
      if (model.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 2.0,
          runSpacing: 4.0,
          children: model.userInterest.map((e) {
            int index = model.userInterest.indexOf(e);
            return CustomCheckbox(
              onChange: (value) {
                model.setSelected(index,value);
              },
              isChecked: model.isChecked[index],
              text: model.userInterest[index],
            );
          }).toList(),
        ),
      );
    });
  }
}
