import 'package:dio/dio.dart';
import 'package:taskf/app/core/exception/exceptions.dart';

class ProductRepository {
  final Dio dio;

  ProductRepository(this.dio);
  dynamic getProductsRequest() async {
    try {
      Response? response = await dio.get('/products');
      return response;
    } catch (e) {
      return e;
    }
  }

  Future<Map<String, dynamic>> getProductsRequestt() async {
    try {
      Response? response = await dio.get('/products');
      Map<String, dynamic> mapData = Map<String, dynamic>.from(response.data);
      return mapData;
    } on DioError catch (e) {
      String errorMessage = MyDioError.returnErrorType(e);
      print(errorMessage);
      rethrow;
    }
  }
}
