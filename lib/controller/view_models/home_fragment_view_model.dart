import '../../core/constant/data.dart';
import '../../data/network/api_services.dart';
import '../../locator.dart';
import '../base_view_model.dart';

class HomeFragmentViewModel extends BaseViewModel {
  final _api = locator<ApiServices>();

  final List<SelfUser> _user = Data.me;
  List<SelfUser> get match => _user;

  int _selectGender = 0;
  int get selectGender =>_selectGender;
  final List<UserImage> _image = Data.userImageList;
  List<UserImage> get imageList => _image;

  double _distance = 20;
  double get distance => _distance;

  double _age = 20;
  double get age => _age;

  setGender(int value){
    _selectGender = value;
    notifyListeners();
  }


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

  void setDistance(double value){
    _distance = value;
    notifyListeners();
  }

  void setAge(double value){
    _age = value;
    notifyListeners();
  }

  void init() async{
    setLoading();
    // api.login();
    await Future.delayed(const Duration(seconds: 3));
    setSuccess();
    // setError('message');
  }
}
