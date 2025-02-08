import 'dart:convert';

import 'package:moteis/core/network/network_response.dart';

abstract class NetworkResponseMock {
  static NetworkResponse getSuccess(Map<String, dynamic> data) =>
      NetworkResponse(
        status: 200,
        body: jsonEncode(data),
        requestUrl: Uri.parse('http://localhost:3000'),
        requestBody: '',
        method: 'GET',
        headers: {},
      );

  static NetworkResponse getError() => NetworkResponse(
        status: 500,
        body: '',
        requestUrl: Uri.parse('http://localhost:3000'),
        requestBody: '',
        method: 'GET',
        headers: {},
      );
}
