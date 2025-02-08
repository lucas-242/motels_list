import 'dart:convert';

import 'package:moteis/core/errors/errors.dart';

class NetworkResponse {
  NetworkResponse({
    required this.status,
    required this.body,
    required this.requestUrl,
    required this.requestBody,
    required this.method,
    this.headers,
  });

  int status;
  String body;
  Uri requestUrl;
  String requestBody;
  String method;
  Map<String, dynamic>? headers;

  dynamic get json => jsonDecode(body);
}

extension NetworkResponseExtension on Future<NetworkResponse> {
  Future<NetworkResponse> handle() async {
    final response = await this;
    if (response.status < 200 && response.status >= 300) {
      throw ExternalError(
        'An error occurred while processing the request to \n ${response.requestUrl} \n Status: ${response.status} \n Body: ${response.body}',
      );
    }

    return response;
  }
}
