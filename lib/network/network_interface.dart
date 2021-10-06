import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pantry_saver_fe/flavor/flavor.dart';

import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import '../globalnetwork.dart';
import 'data/CustomException.dart';

class NetworkInterface {
  Future<dynamic> post({
    String? url,
    Map<String, dynamic>? bodyParams,
    bool isLogin = false,
    bool formData = true,
  }) async {
    var responseJson;
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      if (!isLogin) {
        dio.options.headers['Authorization'] =
            'Bearer ${sharedPreferences.getString('token')}';
      }
      dio.options.headers['content-type'] = 'application/json';
      print('${ApiFlavor.getBaseUrl()}$url');
      final response = await dio.post(
        '${ApiFlavor.getBaseUrl()}$url',
        data:
            formData ? FormData.fromMap(bodyParams!) : json.encode(bodyParams),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      //print(e.response.toString());
      print('error3');
      print(e.toString());
    }
    return responseJson;
  }

  Future<dynamic> put({
    required String url,
    Map<String, dynamic>? bodyParams,
    bool formData = true,
  }) async {
    var responseJson;
    try {
      final sharedPreferences = await SharedPreferences.getInstance();

      dio.options.headers['Authorization'] =
          'Bearer ${sharedPreferences.getString('token')}';
      dio.options.headers['content-type'] = 'application/json';
      print("KKKKKKK masuk dio.put KKKKKKKKKK");
      final response = await dio.put(
        '${ApiFlavor.getBaseUrl()}$url',
        data:
            formData ? FormData.fromMap(bodyParams!) : json.encode(bodyParams),
      );
      responseJson = response.data;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on DioError catch (e) {
      if (e.response!.statusCode == 406) {
        return e.response!.data;
      }
    }
    return responseJson;
  }

  Future<dynamic> get({
    required String url,
    // bool? isLogin,
  }) async {
    var responseJson;
    try {
      dio.options.headers['content-type'] = 'application/json';

      final sharedPreferences = await SharedPreferences.getInstance();
      print('*********************************************');
      print(sharedPreferences.getString('token'));
      dio.options.headers['Authorization'] =
          'Bearer ${sharedPreferences.getString('token')}';
      final response = await dio.get(
        '${ApiFlavor.getBaseUrl()}$url',
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      // throw Exception(responseJson);
      print('get here');
      print(e.toString());
    }
    return responseJson;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());

      case 404:
        print(response.data);
        break;
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 406:
        return response.data;

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with status : ${response.statusCode}');
    }
  }
}
