part of request_performer;

class _DioRequestInterceptor extends _RequestDebugger {
  static String baseUrl = AppEnvironment.current.baseUrl;

  static String contentType = applicationJsonContentType;

  //! Dio definition
  final Dio baseDio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: AppEnvironment.current.connectTimeout,
      sendTimeout: AppEnvironment.current.sendTimeout,
      receiveTimeout: AppEnvironment.current.receiveTimeout,
      contentType: applicationJsonContentType,
      queryParameters: {'api_key': AppEnvironment.apiKey},
    ),
  );

  //! Loader Setup
  static bool loaderEnabled = true;

  //! Interceptor setup
  Dio get dio {
    // Since baseDio options are settled at instantiation phase,
    // we should only check if we had added an interceptor
    // if not, we should just return the pre settled baseDio
    if (baseDio.interceptors.isNotEmpty) return baseDio;

    // No interceptors Added yet, let's add one :)
    baseDio.interceptors
      ..clear()
      ..add(
        QueuedInterceptorsWrapper(
          onRequest: (options, handler) async {
            // ConnectivityManagerLocator.checkConnectivityStatus();

            if (loaderEnabled) EasyLoading.show();
            options.baseUrl = baseUrl;

            options.headers.setupContentType(contentType);
            describeRequest(options);

            return handler.next(options);
          },
          onResponse: (response, handler) {
            describeResponse(response);
            jsonEncode(response.data);
            restoreRequestConfiguration();
            return handler.next(response);
          },
          onError: (error, handler) {
            describeError(error);
            restoreRequestConfiguration();
            return handler.next(error);
          },
        ),
      );

    return baseDio;
  }

  void restoreRequestConfiguration() {
    contentType = applicationJsonContentType;
    if (loaderEnabled) EasyLoading.dismiss();
    _RequestDebugger.debugginEnabled = true;
  }
}

class _RequestDebugger {
  static bool debugginEnabled = false;

  void describeRequest(final RequestOptions requestOptions) {
    if (!debugginEnabled) return;
    debugRequest('___________________________________________________________________________________');

    debugRequest('|    ---- ENIRONNMENT     : ${AppEnvironment.current}');
    debugRequest('|    ---- Base Url        : ${requestOptions.baseUrl}');
    debugRequest('|    ---- Endpoint        : ${requestOptions.path}');
    debugRequest('|    ---- headers         : ${requestOptions.headers}');
    debugRequest('|    ---- queryParameters : ${requestOptions.queryParameters}');
    debugRequest('|    ---- data            : ${requestOptions.data}');
    debugRequest('___________________________________________________________________________________');
  }

  void describeResponse(final Response<dynamic> response) {
    if (!debugginEnabled) return;
    debugResponse('___________________________________________________________________________________');
    debugResponse('|    ---- Status Code:    : ${response.statusCode}');
    debugResponse('|    ---- Status Message  : ${response.statusMessage}');
    debugResponse('|    ---- Base Url        : ${response.requestOptions.baseUrl}');
    debugResponse('|    ---- Endpoint        : ${response.requestOptions.path}');
    debugResponse('|    ---- Data            : ${response.data}');
    debugResponse('___________________________________________________________________________________');
  }

  void describeError(final DioError error) {
    getx.Get.closeAllSnackbars();
    getx.Get.snackbar(
      error.error.toString(),
      error.response?.statusMessage ?? '',
      snackPosition: getx.SnackPosition.BOTTOM,
      backgroundColor: AppThemes.isLight ? AppColors.errorColor.withOpacity(.05) : AppColors.secondaryColor,
      duration: const Duration(seconds: 5),
    );

    debugError('___________________________________________________________________________________');
    debugError('|    ---- Base Url       : ${error.requestOptions.baseUrl}');
    debugError('|    ---- Endpoint       : ${error.requestOptions.path}');
    debugError('|    ---- Error Type     : ${error.type}');
    debugError('|    ---- Status Message : ${error.response?.statusMessage}');
    debugError('|    ---- Status code    : ${error.response?.statusCode}');
    debugError('|    ---- Error message  : ${error.response?.data}');
    debugError('___________________________________________________________________________________');
  }

  void debugRequest(String text) => Print.yellow(text);
  void debugResponse(String text) => Print.green(text);
  void debugError(String text) => Print.red(text);
}
