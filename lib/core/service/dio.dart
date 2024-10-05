import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:todo_list/core/utils/secure_headers.dart';

Dio dio = Dio();

Future<Response> getIt(
  String url,
  Map<String, dynamic>? headers,
) async {
  Logger().i(url);
  final getHeaders = headers ?? await SecureHeaders.getHeaders();
  final result = await dio.get(url,
      options: Options(
        headers: getHeaders,
        contentType: "application/json",
      ));
  // Logger().d(result.data);
  return result;
}

Future<Response> postIt(
  String url,
  Map<String, dynamic>? headers,
  Map<String, dynamic> body,
) async {
  Logger().i(url);
  Logger().i(body);
  final getHeaders = headers ?? await SecureHeaders.getHeaders();
  final result = await dio.post(
    url,
    data: json.encode(body),
    options: Options(
      headers: getHeaders,
      contentType: "application/json",
    ),
  );
  Logger().d(result.data);
  return result;
}

Future<Response> putIt(
  String url,
  Map<String, dynamic>? headers,
  Map<String, dynamic> body,
) async {
  Logger().i(url);
  Logger().i(body);
  final getHeaders = headers ?? await SecureHeaders.getHeaders();
  final result = await dio.put(
    url,
    data: json.encode(body),
    options: Options(
      headers: getHeaders,
      contentType: "application/json",
    ),
  );
  Logger().d(result.data);
  return result;
}

Future<Response> deleteIt(
  String url,
  Map<String, dynamic>? headers,
  Map<String, dynamic> body,
) async {
  Logger().i(url);
  Logger().i(body);
  final getHeaders = headers ?? await SecureHeaders.getHeaders();
  final result = await dio.delete(
    url,
    data: json.encode(body),
    options: Options(
      headers: getHeaders,
      contentType: "application/json",
    ),
  );
  Logger().d(result.data);
  return result;
}
