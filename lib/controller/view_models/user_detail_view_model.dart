import '../../data/network/api_services.dart';
import '../../locator.dart';
import '../base_view_model.dart';

class UserDetailsViewModel extends BaseViewModel {
  final _api = locator<ApiServices>();

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
}
