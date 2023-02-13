import 'package:ding_dong/controller/view_models/chat_fragment_view_model.dart';
import 'package:ding_dong/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../controller/view_models/match_fragment_view_model.dart';
import '../../../core/constant/data.dart';
import '../../../core/router/assets_route.dart';
import '../../../core/router/screen_route.dart';
import '../../../generated/l10n.dart';
import '../auth/splash_screen.dart';
import '../base_view.dart';

class MessageFragment extends StatelessWidget {
  const MessageFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              AssetsPath.userBack,height: 8.w,
            ),
          ),
          centerTitle: true,
          title: Text(
            S.current.ms_title,
            style: TextStyle(
                letterSpacing: 2,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(child: _buildMessageContent(context)));
  }

  Widget _buildMessageContent(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.w,
          ),
          Padding(
            padding: EdgeInsets.all(4.w),
            child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: S.current.ui_search,
                    suffixIcon: const Icon(Icons.search,color: AppColors.iconTopColor,),
                    labelStyle: const TextStyle(
                      color: AppColors.iconTopColor
                    ),
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color:AppColors.iconTopColor, width: 1),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: SplashScreen.gradientTopColor, width: 1)))),
          ),
          SizedBox(
            height: 4.w,
          ),
          _buildTitle(S.current.ms_activity),
          SizedBox(height: 3.w),
          _buildActivityList(),
          SizedBox(height: 6.w),
          _buildTitle(S.current.ms_title),
          SizedBox(height: 3.w),
          _buildChatList()
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Row(
      children: [
        SizedBox(
          width: 4.w,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildActivityList() {
    return Container(
      height: 12.h,
      child: BaseStatefulView<MessageFragmentViewModel>(loadOnInit: (model) {
        model.init();
      }, builder: (context, model, child) {
        if (model.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: 15,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.only(right: 2.w,left: 2.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                      Border.all(color: Colors.greenAccent, width: 3)),
                  child: Padding(
                    padding: EdgeInsets.all(1.7.w),
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration:const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://picsum.photos/id/237/200/300'),
                              fit: BoxFit.cover)),
                    ),
                  ));
            });
      }),
    );
  }

  Widget _buildChatList() {
    return BaseStatefulView<MessageFragmentViewModel>(loadOnInit: (model) {
      model.init();
    }, builder: (context, model, child) {
      if (model.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
          itemCount: model.chatList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return _buildChats(context,model.chatList[index]);
          });
    });
  }

  Widget _buildChats(BuildContext context,UserChats chats){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ScreenRoutes.userChat);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 3.3.w, bottom: 3.3.w),
        child: Row(
          children: [
            SizedBox(
              width: 3.w,
            ),
            CircleAvatar(
              backgroundImage:  AssetImage(
                  chats.image),
              radius: 4.2.h,
            ),
            SizedBox(width: 3.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  chats.name,
                  style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 1.w),
                Text(
                  chats.message,
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 9.sp,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              DateFormat('hh:mm a').format(chats.time),
              // "${chats.time.hour}:${chats.time.minute}",
              style: TextStyle(
                fontSize: 8.sp,
              ),
            ),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }
}
