import '../../core/constant/data.dart';
import '../../data/network/api_services.dart';
import '../../locator.dart';
import '../base_view_model.dart';

class MatchFragmentViewModel extends BaseViewModel {
  final _api = locator<ApiServices>();

  final List<User> _userList =[];
  List<User> get matchList => _userList;

  login(String email, String pass) async{
    // call api from api
    setLoading();
    // api.login();
    await Future.delayed(const Duration(seconds: 5));
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
    _userList.addAll(Data.matchList);
    setSuccess();
    // setError('message');
  }
}
