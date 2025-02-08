import 'package:moteis/core/network/network_response.dart';

abstract interface class NetworkService {
  Future<NetworkResponse> get(String url);
}
