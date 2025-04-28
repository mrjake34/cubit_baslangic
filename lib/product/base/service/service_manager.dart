import 'package:cubit_baslangic/product/base/model/base_response_model.dart';
import 'package:cubit_baslangic/product/base/service/i_service_manager.dart';
import 'package:dio/dio.dart';

final class DioServiceManager implements IServiceManager {
  DioServiceManager() {
    _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  }

  late Dio _dio;

  @override
  Future<BaseResponseModel<dynamic>> get(String path) async {
    Response<dynamic> response;
    try {
      response = await _dio.get(path);
    } on DioException catch (e) {
      return BaseResponseModel(
        data: null,
        error: e.response?.statusMessage,
        isSuccess: false,
        statusCode: e.response?.statusCode,
      );
    }
    return BaseResponseModel(
      data: response.data,
      isSuccess: true,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<BaseResponseModel<dynamic>> post(String path) async {
    Response<dynamic> response;
    try {
      response = await _dio.post(path);
    } on DioException catch (e) {
      return BaseResponseModel(
        data: null,
        error: e.response?.statusMessage,
        isSuccess: false,
        statusCode: e.response?.statusCode,
      );
    }
    return BaseResponseModel(
      data: response.data,
      statusCode: response.statusCode,
    );
  }
}
