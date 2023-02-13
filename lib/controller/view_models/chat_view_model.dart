import '../../core/constant/data.dart';
import '../../data/network/api_services.dart';
import '../../locator.dart';
import '../base_view_model.dart';

class ChatViewModel extends BaseViewModel {
  final _api = locator<ApiServices>();

   List<ChatMessage> _message = [];
  List<ChatMessage> get messages => _message;

  loadChat() async{
    // call api from api
    setLoading();
    // api.login();
    await Future.delayed(const Duration(seconds: 5));
    // _message = Data.messages;
    setSuccess();
    // setError('message');
  }

  void init() async{
    setLoading();
    // api.login();
    await Future.delayed(const Duration(seconds: 3));
    setSuccess();
    // setError('message');
  }

  sendMessage(String text){
    _message =[..._message,ChatMessage(text, "sender")];
    _message =[..._message,ChatMessage('reply of $text', "receiver")];
    notifyListeners();
  }

  addMessage(ChatMessage msg){
    _message =[..._message,msg];
    notifyListeners();
  }
}
