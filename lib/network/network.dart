import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_credit_flutter_task/model/response_api.dart';

class ApiManager {
  var dio = Dio();

  _checkConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<bool>
  getContentHome(
      {ValueChanged<ResponseApi> onSuccess,
        String path, // for testing error path purpose
      ValueChanged<String> onError}) async {
    bool isConnected = await _checkConnection();

    if (!isConnected) {
      onError("No Internet");
      return true;
    }

    bool isError = false;

    try {
      var response = await dio.request(
          path ?? "https://private-a8e48-hcidtest.apiary-mock.com/home",
          options: Options(responseType: ResponseType.json, method: "GET"));
      ResponseApi apiResponse = ResponseApi.fromJson(response.data);
      onSuccess(apiResponse);
    } on DioError catch (error) {
      onError(error.error.toString());
      isError = true;
    } catch (err) {
      onError(err.toString());
      isError = true;
    }
    return isError;
  }
}
