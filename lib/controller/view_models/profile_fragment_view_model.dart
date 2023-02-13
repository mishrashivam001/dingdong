import 'package:ding_dong/core/constant/data.dart';

import '../../data/network/api_services.dart';
import '../../locator.dart';
import '../base_view_model.dart';

class ProfileFragmentViewModel extends BaseViewModel {
  final _api = locator<ApiServices>();

  final UserProfile _user = Data.user;
  UserProfile get match => _user;

  userProfile(String email, String pass) async{
    // call api from api
    setLoading();
    // api.login();
    await Future.delayed(Duration(seconds: 5));
    setSuccess();
    setError('message');
  }

  @override
  void dispose() {
    //... dispose items
    super.dispose();
  }

  void init() async{
    setLoading();
    // api.login();
    await Future.delayed(const Duration(seconds: 3));
    setSuccess();
    // setError('message');
  }

}
