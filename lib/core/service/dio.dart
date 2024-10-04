import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Dio dio = Dio();

Future<Response> getIt(
  String url,
) async {
  Logger().i(url);
  final result = await dio.get(url,
      options: Options(
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
  final result = await dio.post(
    url,
    data: json.encode(body),
    options: Options(
      headers: headers,
      contentType: "application/json",
    ),
  );
  Logger().d(result.data);
  return result;
}
