import 'package:ding_dong/core/constant/data.dart';
import '../../data/network/api_services.dart';
import '../../locator.dart';
import '../base_view_model.dart';

class UserInterestViewModel extends BaseViewModel {
  final _api = locator<ApiServices>();

  final CreateInterests _interests = Data.userInterest;
  CreateInterests get interests => _interests;

  List<bool> _isChecked = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,];
  List<bool> get isChecked => _isChecked;


  final List<String> _userInterest = Data.userInterestList;
  List<String> get userInterest => _userInterest;


  @override
  void dispose() {
    //... dispose items
    super.dispose();
  }

  void setSelected(int index,bool isChecked){
    _isChecked[index] = isChecked;
    notifyListeners();
  }

  // void setIntersts(String value){
  //   _selectInterest = value;
  //   notifyListeners();
  // }

  void init() async{
    setLoading();
    // api.login();
    await Future.delayed(const Duration(seconds: 3));
    setSuccess();
    // setError('message');
  }
}
