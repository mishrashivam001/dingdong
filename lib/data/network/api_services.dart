
import 'package:dio/dio.dart';

class ApiServices {
  static ApiServices instance = ApiServices._();
  late Dio _dio;
  ApiServices._() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.planetgraphdevs.top/',
      receiveDataWhenStatusError: true,
    );
    _dio = Dio(options);
    _dio.options.headers["Accept"] = "application/json";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.connectTimeout = 150000;
    _dio.options.sendTimeout = 100000;
    _dio.options.receiveTimeout = 120000;
  }

  Dio get dio => _dio;

  Future<String?> loginWithMobile(String phone) async{
  await  Future.delayed(const Duration(seconds: 3));
  return null;
  }

}