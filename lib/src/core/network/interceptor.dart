import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// This interceptor is used to show request and response logs
class LoggerInterceptor extends Interceptor {

  Logger logger = Logger(
      printer: PrettyPrinter(
          methodCount: 0,
          colors: true,
          printEmojis: true
      )
  );

  @override
  void onError( DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request: $requestPath'); //Error log
    logger.d('Error type: ${err.error} \n '
        'Error message: ${err.message}'); //Debug log
    handler.next(err); //Continue with the Error
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final buffer = StringBuffer()
      ..writeln("➡️ ${options.method} Request")
      ..writeln("🔗 URI: ${options.uri}")
      ..writeln("📍 Endpoint: ${options.path}")
      ..writeln("📦 Headers: ${options.headers}");

    if (options.queryParameters.isNotEmpty) {
      buffer.writeln("❓ Query Params: ${options.queryParameters}");
    }

    if (options.data != null) {
      if (options.data is FormData) {
        final formData = options.data as FormData;

        final fields = formData.fields.map((e) => "${e.key}: ${e.value}").join(", ");
        final files = formData.files.map((f) => "${f.key}: ${f.value.filename}").join(", ");

        buffer.writeln("📝 FormData Fields: {$fields}");
        if (formData.files.isNotEmpty) {
          buffer.writeln("📎 FormData Files: {$files}");
        }
      } else {
        buffer.writeln("📝 Body: ${options.data}");
      }
    }

    logger.i(buffer.toString());
    handler.next(options);
  }



  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i('STATUS CODE: ${response.statusCode} \n '
        'STATUS MESSAGE: ${response.statusMessage} \n'
        'HEADERS: ${response.headers} \n'); // Debug log
    logger.d('Data: ${response.data}');
    handler.next(response); // continue with the Response
  }
}


