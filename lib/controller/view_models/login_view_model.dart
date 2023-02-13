import '../../data/network/api_services.dart';
import '../../locator.dart';
import '../base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  final _api = locator<ApiServices>();

  login(String email, String pass) {
    // call api from api
  }

  @override
  void dispose() {
    //... dispose items
    super.dispose();
  }
}
