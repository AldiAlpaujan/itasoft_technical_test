import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:itasoft_technical_test/helper/dialog.dart';

//API URL
const url = "https://itasoft.int.joget.cloud/jw/api";

const loginUrl = '/sso';
const warehouseUrl = '/list/list_frmUserMapping';

//Function Helper
getHeader({Map<String, dynamic>? header}) {
  var dataHeader = {
    "Access-Control-Allow-Origin": "*",
    "Accept": "application/json",
    "api_key": "6a9ed2eaf0ff4274ab2370bed8ea31fc",
    "api_id": "API-b8b98d97-008d-4b83-aa59-cb133665638b",
  };

  if (header != null) {
    for (var key in header.keys) {
      dataHeader[key] = header[key];
    }
  }

  return dataHeader;
}

BaseOptions getOptionTimeOut(int seconds) {
  BaseOptions options = BaseOptions(
    receiveDataWhenStatusError: true,
    connectTimeout: Duration(seconds: seconds),
    receiveTimeout: Duration(seconds: seconds),
  );
  return options;
}

Future<MultipartFile> setFileRequest(File file) async {
  String fileName = file.path.split('/').last;
  return await MultipartFile.fromFile(
    file.path,
    filename: fileName,
  );
}

FormData setFormData(Map<String, dynamic> map) {
  return FormData.fromMap(map);
}

dynamic getDataResponse(Response data) {
  var response = data.data;
  return response;
}

Future<bool> manageResponse(
  dynamic data, {
  bool success = false,
  bool error = true,
}) async {
  if (data is Response && data.statusCode == 200) {
    var response = data;
    return await _successResponse(response, success);
  } else {
    var exception = data as DioException;
    return await _errorResponse(exception, error);
  }
}

Future<bool> _successResponse(Response data, bool showMsg) async {
  var response = data.data;
  if (showMsg == true) {
    info(message: response['message']);
  }
  return true;
}

Future<bool> _errorResponse(DioException exception, bool showMsg) async {
  final response = exception.response;
  final data = response?.data;
  final statusCode = response?.statusCode;
  const msg = 'Tidak dapat mengirim permintaan';

  final requestOptions = exception.requestOptions;
  log(requestOptions.baseUrl + requestOptions.path);
  log(exception.toString());
  log(data.toString());

  if (showMsg) {
    if (response != null) {
      try {
        if (statusCode! >= 400) {
          info(message: data["message"] ?? msg);
        }
        if (statusCode == 500) {
          error(message: msg);
        }
      } catch (e) {
        error(message: msg);
      }
    } else {
      if (exception.message != null) {
        error(message: msg);
      } else {
        error(message: msg);
      }
    }
  }
  return false;
}
