library request_performer;

import 'dart:async';
import 'dart:developer';

import 'package:fitness_exercises_challenge/app/environment/app_environment.dart';
import 'package:fitness_exercises_challenge/app/resources/app_resources.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as getx;
import 'package:intl/intl.dart';

import '../app/design/index.dart';
import '../utils/index.dart';
import 'exports.dart';
import 'utils/response_decoding.dart';

part 'request_interceptor.dart';

/// #### A Generic request performer based on a smart Dio Interceptor
class RequestPerformer extends _DioRequestInterceptor {
  void _preRequestSetup({
    final bool loaderEnabled = true,
    final bool debugginEnabled = true,
    String? baseUrl,
    final String? contentType,
    final StringKeyedMap? extraHeaders,
  }) {
    _DioRequestInterceptor.contentType = contentType ?? applicationJsonContentType;
    _DioRequestInterceptor.loaderEnabled = loaderEnabled;
    _DioRequestInterceptor.baseUrl = baseUrl ?? AppEnvironment.current.baseUrl;
    _RequestDebugger.debugginEnabled = debugginEnabled;
    dio.options.headers.addExtraHeaders(extraHeaders);
  }

  /// ### A generic method that consumes an API and handles automatic data serialization/mocking
  Future<R?> performDecodingRequest<R, MP extends ModelingProtocol>({
    required MP decodableModel,
    final bool mockingEnabled = false,
    final bool loaderEnabled = true,
    final bool debugginEnabled = true,
    final bool paginated = false,
    required RestfullMethods method,
    String? baseUrl,
    required String path,
    final dynamic data,
    final String? contentType,
    final StringKeyedMap? extraHeaders,
    final StringKeyedMap? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async {
    _preRequestSetup(
      loaderEnabled: loaderEnabled,
      debugginEnabled: debugginEnabled,
      baseUrl: baseUrl,
      contentType: contentType,
      extraHeaders: extraHeaders,
    );

    if (AppEnvironment.mockingEnabled || mockingEnabled) {
      await Future.delayed(const Duration(milliseconds: 500));
      return decode(
        decodableModel,
        mockingData: decodableModel.mockingData,
      ) as R;
    }

    switch (method) {
      case RestfullMethods.get:
        return dio
            .get(path,
                queryParameters: queryParameters,
                options: options,
                cancelToken: cancelToken,
                onReceiveProgress: onReceiveProgress)
            .then((response) => decode(decodableModel, response: response));

      case RestfullMethods.post:
        return dio
            .post(path,
                data: data,
                queryParameters: queryParameters,
                options: options,
                cancelToken: cancelToken,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress)
            .then((response) => decode(decodableModel, response: response));

      case RestfullMethods.put:
        return dio
            .put(path,
                data: data,
                queryParameters: queryParameters,
                options: options,
                cancelToken: cancelToken,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress)
            .then((response) => decode(decodableModel, response: response));

      case RestfullMethods.patch:
        return dio
            .patch(path,
                data: data,
                queryParameters: queryParameters,
                options: options,
                cancelToken: cancelToken,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress)
            .then((response) => decode(
                  decodableModel,
                  response: response,
                ));

      case RestfullMethods.delete:
        return dio
            .delete(path, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken)
            .then((response) => decode(
                  decodableModel,
                  response: response,
                ));
    }
  }

  /// ### A generic method that downloads a file, stores it in the download folder and returns its path
  Future<String?> performDownloadRequest({
    String? baseUrl,
    required String path,
    required String fileName,
    required String fileExtension,
    bool loaderEnabled = false,
    bool debugginEnabled = false,
    final StringKeyedMap? extraHeaders,
    final StringKeyedMap? queryParameters,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    _preRequestSetup(
      loaderEnabled: loaderEnabled,
      debugginEnabled: debugginEnabled,
      baseUrl: baseUrl,
      contentType: applicationJsonContentType,
      extraHeaders: extraHeaders,
    );

    dio.options.headers.setupAcceptedResponseTypeTo(fileExtension);

    return dio
        .get(path,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            options: Options(
                responseType: ResponseType.bytes, followRedirects: false, validateStatus: (statusCode) => statusCode == 200))
        .then((result) async {
      final String currentLocale = Intl.getCurrentLocale();
      final fullDateString =
          '${DateFormat.yMd(currentLocale).format(DateTime.now()).replaceAll('/', '_')}__${DateFormat.Hms(currentLocale).format(DateTime.now()).replaceAll(':', '_')}';

      final String storingPath = '${await AppResources.storageFolderPerPlatfrom()}/$fileName-$fullDateString.$fileExtension';

      try {
        await File(storingPath).writeAsBytes(result.data as Uint8List);
      } catch (error) {
        log(error.toString());
      }

      return storingPath;
    });
  }

  Future<bool> performUploadRequest({
    String? baseUrl,
    bool mockingEnabled = false,
    bool loaderEnabled = true,
    required RestfullMethods method,
    required String path,
    final dynamic formData,
    final Map<String, dynamic>? extraHeaders,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
  }) async {
    assert(
      [RestfullMethods.post, RestfullMethods.put].contains(method),
      '\n[RequestPerformer => performUploadRequest] Only POST/PUT method are accepted for download request',
    );

    _preRequestSetup(
      loaderEnabled: loaderEnabled,
      debugginEnabled: false,
      baseUrl: baseUrl,
      contentType: multipartFormDataContentType,
      extraHeaders: extraHeaders,
    );

    if (AppEnvironment.mockingEnabled || mockingEnabled) return Future.value(true);

    if (method == RestfullMethods.post) {
      return dio
          .post(path,
              data: formData,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onSendProgress: onSendProgress)
          .then((response) => response.statusCode == 200);
    } else {
      return dio
          .put(path,
              data: formData,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onSendProgress: onSendProgress)
          .then((response) => response.statusCode == 200);
    }
  }
}
