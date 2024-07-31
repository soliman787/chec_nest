
import 'package:dio/dio.dart';

class ApiService {

  final _baseUrl = 'https://fakestoreapi.com/';

  final Dio _dio;

  ApiService(this._dio);

  Future<List<dynamic>> get({required endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

}