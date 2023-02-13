import 'package:ding_dong/controller/view_models/chat_fragment_view_model.dart';
import 'package:ding_dong/controller/view_models/chat_view_model.dart';
import 'package:ding_dong/controller/view_models/home_fragment_view_model.dart';
import 'package:ding_dong/controller/view_models/match_fragment_view_model.dart';
import 'package:ding_dong/controller/view_models/match_screen_view_model.dart';
import 'package:ding_dong/controller/view_models/prf_complete_view_model.dart';
import 'package:ding_dong/controller/view_models/prf_detail_view_model.dart';
import 'package:ding_dong/controller/view_models/profile_fragment_view_model.dart';
import 'package:ding_dong/controller/view_models/user_detail_view_model.dart';
import 'package:ding_dong/controller/view_models/user_interest_view_model.dart';
import 'package:ding_dong/controller/view_models/user_loc_view_model.dart';
import 'package:ding_dong/controller/view_models/user_pics_view_model.dart';
import 'package:ding_dong/controller/view_models/verify_view_models.dart';
import 'package:ding_dong/controller/view_models/wlcmscreen_view_model.dart';
import 'package:get_it/get_it.dart';
import 'controller/view_models/login_view_model.dart';
import 'data/network/api_services.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => ApiServices.instance);
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => WelcomeViewModel());
  locator.registerFactory(() => VerifyViewModel());
  locator.registerFactory(() => ProfileDetailViewModel());
  locator.registerFactory(() => UserInterestViewModel());
  locator.registerFactory(() => UserLocationViewModel());
  locator.registerFactory(() => UserDetailsViewModel());
  locator.registerFactory(() => UserMatchViewModel());
  locator.registerFactory(() => UserPicViewModel());
  locator.registerFactory(() => MatchFragmentViewModel());
  locator.registerFactory(() => ProfileFragmentViewModel());
  locator.registerFactory(() => MessageFragmentViewModel());
  locator.registerFactory(() => HomeFragmentViewModel());
  locator.registerFactory(() => ProfileCompViewModel());
  locator.registerFactory(() => ChatViewModel());
}
