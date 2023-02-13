import 'package:ding_dong/controller/provider/theme_provider.dart';
import 'package:ding_dong/controller/view_models/user_interest_view_model.dart';
import 'package:ding_dong/core/constant/app_colors.dart';
import 'package:ding_dong/core/constant/data.dart';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:ding_dong/core/router/screen_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import '../../../generated/l10n.dart';
import '../base_view.dart';
import '../custom/custom_checkbox.dart';
import '../auth/splash_screen.dart';

class UserInterests extends StatelessWidget {
  const UserInterests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UserInterestsPage();
  }
}

class UserInterestsPage extends StatefulWidget {
  const UserInterestsPage({super.key});

  @override
  State<UserInterestsPage> createState() => _UserInterestsPageState();
}

class _UserInterestsPageState extends State<UserInterestsPage> {
  String dateValue = '15';
  String monthValue = 'March';
  String yearValue = "2002";
  List<String> dateItems = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];
  List<String> monthItems = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List<String> yearItems = [
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: SplashScreen.gradientTopColor,
          ),
        ),
        centerTitle: true,
        title: SvgPicture.asset(
          AssetsPath.getLogo,
        ),
      ),
      body: SingleChildScrollView(
        child: BaseStatelessView<UserInterestViewModel>(
          builder: (context, model, child) {
            return _buildInterestContent(context, model.interests);
          },
        ),
      ),
    );
  }

  Widget _buildInterestContent(
      BuildContext context, CreateInterests userInterest) {
    return Container(
        margin: EdgeInsets.only(top: 6.w, right: 6.w, left: 6.w),
        child: BaseStatefulView<UserInterestViewModel>(loadOnInit: (model) {
          model.init();
        }, builder: (context, model, child) {
          if (model.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userInterest.title,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,),
              ),
              SizedBox(height: 3.w),
              Text(
                userInterest.desc,
                style: TextStyle(fontSize: 13.sp),
              ),
              SizedBox(height: 5.w),
              TextField(
                  autocorrect: true,
                  decoration: _inputDecoration.copyWith(
                    border: const OutlineInputBorder(),
                    labelText: S.current.ui_search,
                    labelStyle: const TextStyle(color: AppColors.iconTopColor),
                  )),
              SizedBox(height: 5.w),
              _buildInterests(userInterest),
              SizedBox(height: 5.w),
              Text(
                S.current.ui_dob,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,),
              ),
              SizedBox(height: 5.w),
              _buildDob(),
              SizedBox(height: 10.w),
              SizedBox(
                height: 5.h,
                width: 90.w,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ScreenRoutes.profComp);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(SplashScreen.gradientTopColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.w),
                        ))),
                    child: Text(
                      S.current.started_conti,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    )),
              ),
              SizedBox(height: 10.w),
            ],
          );
        }));
  }

  final List<bool> _statesSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  Widget _buildInterests(CreateInterests userInterests) {
    return Center(
      child: BaseStatefulView<UserInterestViewModel>(loadOnInit: (model) {

        model.init();
      }, builder: (context, model, child) {
        if (model.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: model.interests.interest.map((e) {
            int index = model.interests.interest.indexOf(e);
            return CustomCheckbox(
              onChange: (bool value) {
                //MyThemePreferences.saveValue(index, value);
                setState(() {
                  _statesSelected[index] = !_statesSelected[index];
                });
              },
              isChecked: _statesSelected[index],
              text: userInterests.interest[index],
            )  ;
          }  ).toList(),
        );
      }),
    );
  }


  Widget _buildDob() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 5.w,),
          Column(children: <Widget>[
            Text(
              S.current.ui_day,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              decoration: BoxDecoration(
                  color: SplashScreen.gradientTopColor.withOpacity(0.9),
                  borderRadius: BorderRadius.all(Radius.circular(2.w))),
              child: DropdownButton<String>(
                value: dateValue,
                elevation: 0,
                icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                style: const TextStyle( fontSize: 18),
                onChanged: (String? data) {
                  setState(() {
                    dateValue = data!;
                  });
                },
                items: dateItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ]),

          Column(children: <Widget>[
            Text(
              S.current.ui_mnth,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              decoration: BoxDecoration(
                  color: SplashScreen.gradientTopColor.withOpacity(0.9),
                  borderRadius: BorderRadius.all(Radius.circular(2.w))),
              child: DropdownButton<String>(
                value: monthValue,
                elevation: 0,
                icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                style: const TextStyle( fontSize: 18),
                underline: Container(
                  height: 2,
                ),
                onChanged: (String? data) {
                  setState(() {
                    monthValue = data!;
                  });
                },
                items: monthItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ]),

          Column(children: <Widget>[
            Text(
              S.current.ui_year,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              decoration: BoxDecoration(
                  color: SplashScreen.gradientTopColor.withOpacity(0.9),
                  borderRadius: BorderRadius.all(Radius.circular(2.w))),
              child: DropdownButton<String>(
                value: yearValue,
                elevation: 0,
                icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                style: const TextStyle( fontSize: 18),
                underline: Container(
                  height: 2,
                ),
                onChanged: (String? data) {
                  setState(() {
                    yearValue = data!;
                  });
                },
                items: yearItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ]),
          SizedBox(width: 5.w,),
        ],
      ),

    );
  }

  final _inputDecoration = const InputDecoration(
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: AppColors.iconTopColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: AppColors.iconTopColor, width: 1)));
}
