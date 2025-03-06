import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ems_app/define.dart';
import 'package:ems_app/main.dart';
import 'package:ems_app/resources/app_colors.dart';
import 'package:ems_app/utils/AppLog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NetworkInterface {
  final Dio _dio = Dio();

  Future<Response> get(
      {required String url,
      dynamic body,
      String? userToken,
      Map<String, dynamic>? query,
      String contentType = 'application/json'}) async {
    try {
      Options options = Options(headers: {
        HttpHeaders.authorizationHeader: userToken ?? '',
        'Content-Type': contentType,
      });

      _logRequest("GET", url: url, options: options, body: body, query: query);
      Response response = await _dio.get(url, data: body, queryParameters: query, options: options);
      _logResponse("GET", url, response);

      return response;
    } catch (e) {
      _handleDioError(e, "GET", url);
      throw Exception('Failed to get data');
    }
  }

  Future<Response> post(
      {required String url,
        dynamic body,
        String? userToken,
        Map<String, dynamic>? query,
        String contentType = 'application/json'}) async {
    try {
      Options options =
      Options(headers: {HttpHeaders.authorizationHeader: userToken ?? '', 'Content-Type': contentType});
      _logRequest("POST", url: url, options: options, body: body, query: query);
      Response response = await _dio.post(url, data: body, queryParameters: query, options: options);
      _logResponse("POST", url, response);

      return response;
    } catch (e) {
      _handleDioError(e, "POST", url);
      throw Exception('Failed to post data');
    }
  }

  Future<Response> delete({required String url, dynamic body, String? userToken, Map<String, dynamic>? query}) async {
    try {
      Options options = Options(headers: {
        HttpHeaders.authorizationHeader: userToken ?? '',
      });

      _logRequest("DELETE", url: url, options: options, body: body, query: query);
      Response response = await _dio.delete(url, data: body, queryParameters: query, options: options);
      _logResponse("DELETE", url, response);

      return response;
    } catch (e) {
      _handleDioError(e, "DELETE", url);
      throw Exception('Failed to delete data');
    }
  }

  Future<Response> put(
      {required String url,
        dynamic body,
        String? userToken,
        Map<String, dynamic>? query,
        String contentType = 'application/json'}) async {
    try {
      Options options =
      Options(headers: {HttpHeaders.authorizationHeader: userToken ?? '', 'Content-Type': contentType});

      _logRequest("PUT", url: url, options: options, body: body, query: query);
      Response response = await _dio.put(url, queryParameters: query, data: body, options: options);
      _logResponse("PUT", url, response);

      return response;
    } catch (e) {
      _handleDioError(e, "PUT", url);
      throw Exception('Failed to put data');
    }
  }

  Future<Response> wrapperHttpError(Future<Response> Function() block) async {
    try {
      var response = await block();
      if (response.statusCode == 200) {
        return response;
      } else {
        if (appContext != null) {
          showToast(
              context: appContext!, text: "伺服器異常，請回報開發商", backgroundColor: AppColors.red, textColor: AppColors.white);
          EasyLoading.dismiss();
        }
        throw Exception('Server error');
      }
    } catch (e) {
      rethrow;
    }
  }

  void _logRequest(String method, {required String url, Options? options, dynamic body, Map<String, dynamic>? query}) {
    AppLog.v("--> START $method $url");
    AppLog.v("Headers: ${jsonEncode(options?.headers)}");
    if (body != null) {
      if (body is FormData) {
        // 印出 FormData 的字段和文件內容
        AppLog.v("FormData Fields:");
        for (var field in body.fields) {
          AppLog.v("Field: ${field.key} = ${field.value}");
        }
        AppLog.v("FormData Files:");
        for (var file in body.files) {
          AppLog.v("File: ${file.key} = ${file.value.filename} (size: ${file.value.length} bytes)");
        }
      } else {
        AppLog.v("Body: ${jsonEncode(body)}");
      }
    } else {
      AppLog.v("No Body");
    }
    AppLog.v(query != null ? "Query: ${jsonEncode(query)}" : "No Query");
    AppLog.v("--> END $method $url");
  }

  void _logResponse(String method, String url, Response response) {
    AppLog.v("<-- START $method ${response.realUri}");
    AppLog.v("Status: ${response.statusCode}");
    AppLog.v("Response: ${jsonEncode(response.data)}");
    AppLog.v("<-- END $method ${url}");
  }

  void _handleDioError(dynamic e, String method, String url) {
    if (e is DioException && e.response != null) {
      final response = e.response!;
      if (response.statusCode == 500) {
        AppLog.e(
            "[$method] Request to $url failed with Internal Server Error: Status=${response.statusCode}, Response=${response.data}");
      }
    }
  }
}
