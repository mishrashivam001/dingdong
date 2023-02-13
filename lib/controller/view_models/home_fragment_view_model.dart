import '../../core/constant/data.dart';
import '../../data/network/api_services.dart';
import '../../locator.dart';
import '../base_view_model.dart';

class HomeFragmentViewModel extends BaseViewModel {
  final _api = locator<ApiServices>();

  final List<SelfUser> _user = Data.me;
  List<SelfUser> get match => _user;

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
    setSuccess();
    // setError('message');
  }
}
