import 'package:note_crud/data/models/response_model.dart';
import 'package:dio/dio.dart';

enum RequestType { get, post, put, patch, delete }

class BaseNetwork {
  static final Dio _dio = Dio();
  static final List<int> _successCode = [200, 201];

  static Future<ResponseModel> get({required String url}) async {
    return await _createRequest(RequestType.get, url: url);
  }

  static Future<ResponseModel> post(
      {required String url, Map<String, dynamic>? body}) async {
    return await _createRequest(
      RequestType.post,
      url: url,
      body: body,
    );
  }

  static Future<ResponseModel> put(
      {required String url, Map<String, dynamic>? body}) async {
    return await _createRequest(
      RequestType.put,
      url: url,
      body: body,
    );
  }

  static Future<ResponseModel> patch(
      {required String url, Map<String, dynamic>? body}) async {
    return await _createRequest(
      RequestType.patch,
      url: url,
      body: body,
    );
  }

  static Future<ResponseModel> delete({required String url}) async {
    return await _createRequest(RequestType.delete, url: url);
  }

  static Future<ResponseModel> _createRequest(
    RequestType type, {
    required String url,
    Map<String, dynamic>? body,
  }) async {
    Response? response;

    switch (type) {
      case RequestType.get:
        response = await _dio.get(url);
        break;
      case RequestType.post:
        response = await _dio.post(url, data: body);
        break;
      case RequestType.put:
        response = await _dio.put(url, data: body);
        break;
      case RequestType.delete:
        response = await _dio.delete(url);
        break;
      case RequestType.patch:
        response = await _dio.patch(url, data: body);
        break;
      default:
    }

    if (_successCode.contains(response!.statusCode)) {
      ///success
      return ResponseModel(
        status: true,
        data: response.data,
        msg: "success",
      );
    } else {
      //error
      return ResponseModel(
        status: false,
        data: null,
        msg: "Error",
      );
    }
  }
}
