import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:ding_dong/controller/view_models/chat_view_model.dart';
import 'package:ding_dong/core/constant/app_colors.dart';
import 'package:ding_dong/core/router/assets_route.dart';
import 'package:ding_dong/core/utils/sizer.dart';
import 'package:ding_dong/ui/screen/base_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/data.dart';

class UserChatScreen extends StatelessWidget {
  UserChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                      icon: SvgPicture.asset(
                        AssetsPath.userBack,height: 8.w,
                      ),
                    ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    padding: EdgeInsets.all(0.5.w),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          tileMode: TileMode.clamp,
                          begin: Alignment(0.0, 1.0),
                          end: Alignment(0.0, -1.0),
                          colors: [
                            AppColors.iconTopColor,
                            AppColors.iconBottomColor
                          ]),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(0.5.w),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/men/5.jpg"),
                        maxRadius: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Kriss Benwat",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Text(
                          "Online",
                          style: TextStyle(
                              fontSize: 9.sp),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: AppColors.iconTopColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        body:
            BaseStatefulView<ChatViewModel>(
                loadOnInit: (model)=>model.loadChat(),
                builder: (context, model, child) {

          if (model.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
              children: [
                _buildInterface(context, model),
                _buildChats(context, model)
              ]);
        }));
  }

  Widget _buildInterface(BuildContext context, ChatViewModel model) {
    return Expanded(
      child: ListView.builder(
        controller: _scroll,
        itemCount: model.messages.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        itemBuilder: (context, index) {
          return Container(
            padding:
                const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
            child: Align(
              alignment: (model.messages[index].messageType == "receiver"
                  ? Alignment.topLeft
                  : Alignment.topRight),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (model.messages[index].messageType == "receiver"
                      ? AppColors.iconTopColor
                      : AppColors.iconBottomColor),
                ),
                padding: const EdgeInsets.all(16),
                child: Text(
                  model.messages[index].messageContent,
                  style:  TextStyle(fontSize:10.sp,color:Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChats(BuildContext context, ChatViewModel model) {
    return Container(
        margin: EdgeInsets.only(left: 2.w, bottom: 1.w, right: 2.w),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.chatHintColor.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(5.w))),
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          margin: EdgeInsets.only(left: 2.w),
                          child: SvgPicture.asset(
                            AssetsPath.chatMic,
                            height: 2.5.h,
                            width: 7.w,
                          )),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: TextFormField(
                          controller: _controller,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: "Type your message",
                            border: InputBorder.none,
                          )),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    SvgPicture.asset(
                      AssetsPath.chatEmoji,
                      height: 2.5.h,
                      width: 7.w,
                    ),
                    SizedBox(width: 3.w),
                    GestureDetector(
                      onTap: () async{
                        var image = _getImage(context, ImageSource.gallery);
/*                        await showDialog(context: context, builder:(_)=>
                          imageDialog(image, context));*/
                      },
                      child: SvgPicture.asset(
                        AssetsPath.chatFile,
                        height: 2.5.h,
                        width: 7.w,
                      ),
                    ),
                    //image != null ? Image.file(image!): const Text("No image selected"),
                    SizedBox(width: 3.w),
                    GestureDetector(
                      onTap: () {
                        //_sendMessage(_controller.text);
                        if(_controller.text.isNotEmpty){
                          model.sendMessage(_controller.text);
                          _controller.clear();
                          _scroll.animateTo(_scroll.position.maxScrollExtent+200, duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
                        }
                      },
                      child: SvgPicture.asset(
                        AssetsPath.chatSend,
                        height: 3.h,
                        width: 10.w,
                      ),
                    ),
                    SizedBox(width: 2.w),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scroll = ScrollController();

  void _getImage(BuildContext context, ImageSource source) async {
    var image = (await ImagePicker().pickImage(source: source)) as File;
    var base64Image = base64Encode(image.readAsBytesSync());
  }

  final List<Message> _messages = [];
  // int _messageId = 0;

  void _sendMessage(String text, Uint8List image) {
      _messages.insert(0, Message(text,"sender", image,true));
      // _messageId++;
  }
  Widget imageDialog(path, context) {
    return Dialog(
        backgroundColor: Colors.transparent,
      // elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: 220,
              height: 200,
              child: Image.network(
                '$path',
                fit: BoxFit.cover,
              ),
            ),
    )]));
  }

}