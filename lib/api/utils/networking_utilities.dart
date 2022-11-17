import 'dart:io';

import 'package:dartz/dartz.dart' hide State;
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//* Constants
String get applicationJsonContentType => 'application/json';
String get multipartFormDataContentType => 'multipart/form-data';

//* Enums
enum RestfullMethods { get, post, put, delete, patch }

//* TypeDefs
typedef FutureRequestResult<T> = Future<Either<DioError, T?>>;
typedef StringKeyedMap = Map<String, dynamic>;

//* Utilities
const _uuid = Uuid();
String uniqueIdentifier() => _uuid.v4();

//* Extensions
extension HeadersInjections on StringKeyedMap {
  StringKeyedMap setupContentType(String contentType) => this
    ..addAll(
      {HttpHeaders.contentTypeHeader: contentType},
    );

  StringKeyedMap setupAcceptedResponseTypeTo(String acceptedFormat) => this
    ..addAll(
      {HttpHeaders.acceptHeader: 'application/$acceptedFormat'},
    );

  StringKeyedMap addExtraHeaders(StringKeyedMap? extraHeaders) => this..addAll(extraHeaders ?? {});
}

extension FrenchDateformatting on String {
  /// #### `2022-10-15` => `15/10/2022`
  String? get localeFormatted => length == 10 ? DateFormat.yMd(Intl.getCurrentLocale()).format(DateTime.parse(this)) : null;

  /// #### `2022-10-15` => `OCTOBRE 2022`
  String? get fullMonthYearFormatted =>
      length == 10 ? DateFormat.yMMMM(Intl.getCurrentLocale()).format(DateTime.parse(this)).toUpperCase() : null;
}
