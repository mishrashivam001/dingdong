import 'dart:typed_data';

import '../router/assets_route.dart';


class Data {
  static final CreateInterests userInterest = CreateInterests(1,"You can pick up to 5 interests. ", ["Football","Badminton","Cricket","Singing","Dancing","Reading","Basketball"], "Your Interests");
  static final CreateProfile gender = CreateProfile(1,"Female", "Male", "Trans");
  static final CreateProfile genderLike = CreateProfile(1,"Female", "Male", "Trans");
  static final MatchProfile partner = MatchProfile(AssetsPath.userImage,AssetsPath.userPartner, 'Start the new conversation with new approach and create a bonding.',AssetsPath.userLove,"Congratulations");
  static final UserProfile user = UserProfile('Aakash Garg , ', AssetsPath.getCouple, 22);
  // static final SelfUser me = SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer');

  static final List<SelfUser> me = [
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
    SelfUser('Flora Agrawal, ',AssetsPath.userImage, 25, 'Bangalore, ','Karnataka','Product Designer'),
  ];

  static final List<User> matchList = [
    User(AssetsPath.userImage,'Flora Agrawal, ', 25, 'Bangalore, ','Karnataka'),
    User(AssetsPath.userImage,'Flora Agrawal, ', 22, 'Noida, ','Uttar Pradesh'),
    User(AssetsPath.userImage,'Flora Agrawal, ', 21, 'Delhi, ','Delhi'),
    User(AssetsPath.userImage,'Flora Agrawal, ', 18, 'Lucknow, ','Uttar Pradesh'),
    User(AssetsPath.userImage,'Flora Agrawal, ', 23, 'Hyderabad, ','Telangana'),
    User(AssetsPath.userImage,'Flora Agrawal, ', 26, 'Bhopal, ','Madhya Pradesh'),
    User(AssetsPath.userImage,'Flora Agrawal, ', 22, 'Gwalior, ','Madhya Pradesh'),
    User(AssetsPath.userImage,'Flora Agrawal, ', 28, 'Guwahati, ','Assam'),
    User(AssetsPath.userImage,'Flora Agrawal, ', 21, 'Ahmedabad, ','Gujarat'),
    User(AssetsPath.userImage,'Flora Agrawal, ', 20, 'Chandigarh, ','Haryana'),
    User(AssetsPath.userImage,'Flora Agrawal, ', 22, 'Chandigarh, ','Punjab'),
  ];

  static final List<UserChats> chatList =[
    UserChats("Flora Agarwal", AssetsPath.userImage, "Tap to reveal the chat.", DateTime.now()),
    UserChats("Flora Agarwal", AssetsPath.userImage, "Tap to reveal the chat.", DateTime.now()),
    UserChats("Flora Agarwal", AssetsPath.userImage, "Tap to reveal the chat.", DateTime.now()),
    UserChats("Flora Agarwal", AssetsPath.userImage, "Tap to reveal the chat.", DateTime.now()),
    UserChats("Flora Agarwal", AssetsPath.userImage, "Tap to reveal the chat.", DateTime.now()),
    UserChats("Flora Agarwal", AssetsPath.userImage, "Tap to reveal the chat.", DateTime.now()),
    UserChats("Flora Agarwal", AssetsPath.userImage, "Tap to reveal the chat.", DateTime.now()),
    UserChats("Flora Agarwal", AssetsPath.userImage, "Tap to reveal the chat.", DateTime.now()),
    UserChats("Flora Agarwal", AssetsPath.userImage, "Tap to reveal the chat.", DateTime.now()),
    UserChats("Flora Agarwal", AssetsPath.userImage, "Tap to reveal the chat.", DateTime.now()),
    UserChats("Flora Agarwal", AssetsPath.userImage, "Tap to reveal the chat.", DateTime.now()),
    UserChats("Flora Agarwal", AssetsPath.userImage, "Tap to reveal the chat.", DateTime.now()),

  ];
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage(this.messageContent, this.messageType);
}

class Message {
  String messageContent;
  String messageType;
  Uint8List image;
  bool isMe;
  Message(this.messageContent, this.messageType,this.image,this.isMe);
}

class User {
  final String image;
  final String name;
  final int age;
  final String city;
  final String state;
  User(this.image,this.name, this.age, this.city, this.state);
}

class SelfUser {
  final String image;
  final String designation;
  final String city;
  final String state;
  final String name;
  final int age;
  SelfUser(this.name,this.image, this.age,this.state,this.city,this.designation);
}

class UserChats{
  final String image;
  final String name;
  final String message;
  final DateTime time;
  UserChats(this.name,this.image,this.message,this.time);
}

class UserProfile{
  final String name;
  final String image;
  final int age;
  UserProfile(this.name, this.image, this.age);
}

class MatchProfile{
  String userImage;
  String partnerImage;
  String desc;
  String congo;
  String loveImage;
  MatchProfile(this.userImage,this.partnerImage,this.desc,this.loveImage,this.congo);
}

class CreateProfile{
  int id;
  String male;
  String female;
  String trans;
  CreateProfile(this.id,this.female,this.male,this.trans);
}

class CreateInterests{
  int key;
  String title;
  String desc;
  List<String> interest;
  CreateInterests(this.key,this.desc,this.interest,this.title);
}
