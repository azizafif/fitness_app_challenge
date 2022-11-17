import 'dart:developer';

import '../exceptions/exceptions.dart';
import '../exports.dart';

dynamic decode<T extends ModelingProtocol>(
  T decodableModel, {
  Response<dynamic>? response,
  dynamic mockingData,
}) {
  assert(
    mockingData != null || response != null,
    '\n[RequestPerformer => decode] You should provide either some mocking data or a real response to be trated',
  );

  final data = mockingData ?? response?.data;

  try {
    assert(data is List);
    return decodableModel.fromJson(data);
  } catch (error) {
    log(error.toString());

    throw DecodingException();
  }
}
