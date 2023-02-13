import 'package:flutter/foundation.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.NONE;

  ViewState get currentState => _state;

  String _message = 'Unknown Error';

  String get message => _message;

  bool get loading => currentState == ViewState.LOADING;

  bool get hasError => currentState == ViewState.ERROR;

  setLoading() {
    _state = ViewState.LOADING;
    notifyListeners();
  }

  setError(String message) {
    _state = ViewState.ERROR;

    if (message.isEmpty) {
      message = 'Unknown error occurred';
    }

    _message = message;
    notifyListeners();
  }

  setSuccess() {
    _state = ViewState.DATE_READY;
    notifyListeners();
  }
}

enum ViewState { NONE, LOADING, DATE_READY, ERROR }
