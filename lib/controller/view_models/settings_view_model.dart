import 'package:ding_dong/core/constant/data.dart';
import 'package:flutter/material.dart';
import '../../data/network/api_services.dart';
import '../../locator.dart';
import '../base_view_model.dart';

class SettingsViewModel extends BaseViewModel {
  final _api = locator<ApiServices>();

  String? _selectLanguage;
  List<String>? _symbolList;
  RangeValues _distanceRange = const RangeValues(0.01,1.0);
  RangeValues get distanceRange => _distanceRange;
  RangeValues _ageRange = const RangeValues(0.01,1.0);
  RangeValues get ageRange => _ageRange;
  List<String>? get symbolList => _symbolList;
  String? get selectLanguage => _selectLanguage;

  final List<String> _languageList = ["Hindi","English","Marathi","Gujarati","French","German","Bengali","Tamil","Assamese","Telugu","Kashmiri","Japanese","Korean","Chinese"];
  List<String> get languageList => _languageList;

  void setLanguage(String? value){
    _selectLanguage = value!;
    notifyListeners();
  }

  void setAge(RangeValues values){
    if (values.end - values.start >= 0.1) {
      _ageRange = values;
    } else {
      if (_ageRange.start == values.start) {
        _ageRange = RangeValues(_ageRange.start, _ageRange.start + 0.1);
      } else {
        _ageRange = RangeValues(_ageRange.end - 0.1, _ageRange.end);
      }
    }
    notifyListeners();
  }

  void setDistance(RangeValues values){
    if (values.end - values.start >= 0.1) {
      _distanceRange = values;
    } else {
      if (_distanceRange.start == values.start) {
        _distanceRange = RangeValues(_distanceRange.start, _distanceRange.start + 0.1);
      } else {
        _distanceRange = RangeValues(_distanceRange.end - 0.1, _distanceRange.end);
      }
    }
    notifyListeners();
  }

  void init() async{
    setLoading();
    // api.login();
    await Future.delayed(const Duration(seconds: 3));
    setSuccess();

    if (languageList.isNotEmpty == true) {
      _selectLanguage = _languageList[0];
    }
    // setError('message');
  }
}
