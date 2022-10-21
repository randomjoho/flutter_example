// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioUtils {
  static late Uri baseUri;
  static late Dio dio;

  static void updateUri(Uri uri) {
    baseUri = uri;
    dio = _createDio();
  }

  static Dio _createDio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUri.origin,
        connectTimeout: 15000,
        receiveTimeout: 15000,
        headers: {
          Headers.contentTypeHeader: Headers.jsonContentType,
        },
      ),
    );

    // dio.transformer = _FlutterTransformer();

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        // ignore: avoid_redundant_argument_values
        request: true,
        // ignore: avoid_redundant_argument_values
        requestHeader: true,
        // ignore: avoid_redundant_argument_values
        requestBody: true,
        // ignore: avoid_redundant_argument_values
        responseHeader: true,
        // ignore: avoid_redundant_argument_values
        responseBody: true,
        logPrint: (Object object) {
          const int limit = 920;
          void logPrint(message) {
            print('Dio │ $message');
          }

          final String message = object.toString();
          if (message.length <= limit) {
            logPrint(message);
            return;
          }

          final Runes runes = message.runes;
          for (int i = 0; i < runes.length;) {
            final int start = i;
            i = math.min(i + limit, runes.length);
            final String subMessage = message.substring(start, i);
            logPrint(subMessage);
          }
        },
      ));
    }

    // 抓包用
    // if (kDebugMode) {
    //   final adapter = dio.httpClientAdapter as DefaultHttpClientAdapter;
    //   adapter.onHttpClientCreate = (client) {
    //     client.findProxy = (uri) => 'PROXY localhost:8888';
    //   };
    // }

    return dio;
  }
}
