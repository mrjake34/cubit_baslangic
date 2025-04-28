import 'package:cubit_baslangic/product/base/model/base_response_model.dart';

abstract class IServiceManager {
  Future<BaseResponseModel<dynamic>> get(String path);
  Future<BaseResponseModel<dynamic>> post(String path);
}
