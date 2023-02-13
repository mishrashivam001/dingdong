import 'package:ding_dong/core/constant/data.dart';

import '../../data/network/api_services.dart';
import '../../locator.dart';
import '../base_view_model.dart';

class MessageFragmentViewModel extends BaseViewModel {
  final _api = locator<ApiServices>();

  final List<UserChats> _chatsList =[];
  List<UserChats> get chatList => _chatsList;

  login(String email, String pass) async{
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
    _chatsList.addAll(Data.chatList);
    setSuccess();
    // setError('message');
  }
}
