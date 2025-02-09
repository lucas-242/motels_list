import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moteis/core/network/network_response.dart';
import 'package:moteis/core/network/network_service.dart';

class HttpNetworkService implements NetworkService {
  HttpNetworkService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  @override
  Future<NetworkResponse> get(String url) async {
    return _client.get(Uri.parse(url)).then(
          (response) => NetworkResponse(
            status: response.statusCode,
            body: utf8.decode(response.bodyBytes),
            requestUrl: response.request!.url,
            requestBody: '',
            method: response.request!.method,
            headers: response.request!.headers,
          ),
        );
  }
}
