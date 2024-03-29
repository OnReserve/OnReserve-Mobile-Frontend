import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:on_reserve/helpers/network/interceptors/network_cache.dart';
import 'package:on_reserve/helpers/network/interceptors/network_log.dart';

Dio provider(final header) {
  final BaseOptions options = BaseOptions(
    baseUrl: dotenv.get("Base-Url", fallback: ""),
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 50),
    sendTimeout: const Duration(seconds: 50),
    contentType: Headers.jsonContentType,
    headers: header,
  );

  final dio = Dio(options)
    ..interceptors.addAll([
      cacheInterceptor,
      loggerInterceptor,
    ]);

  return dio;
}
