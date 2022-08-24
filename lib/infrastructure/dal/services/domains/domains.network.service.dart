import 'dart:convert';

import '../../../../domain/core/abstractions/http_connect.interface.dart';
import '../../../../domain/core/exceptions/default.exception.dart';
import '../../usecase/domains.services.interface.dart';
import 'models/domains.response.model.dart';

class DomainsNetworkServices extends IDomainServices {
  final IHttpConnect _connect;

  DomainsNetworkServices({required IHttpConnect connect}) : _connect = connect;

  String get _prefix => 'domains';

  @override
  Future<DomainsResponse> getDomains() async {
    try {
      final response = await _connect.get<DomainsResponse>(
        _prefix,
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          // 'user-Agent': 'PostmanRuntime/7.29.2',

        },
        decoder: (value) {
          // print(value);
          return DomainsResponse.fromJson(
            value is String ? jsonDecode(value) : value as Map<String, dynamic>,
          );
        },
      );

      if (response.success) {
        return response.payload!;
      } else {
        switch (response.statusCode) {
          case 500:
            throw DefaultException(
              message: 'Server error',
            );
          default:
            throw DefaultException(
              message: 'Error loading data, check your internet!',
            );
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
