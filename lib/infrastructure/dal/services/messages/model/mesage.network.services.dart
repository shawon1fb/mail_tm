import 'dart:convert';

import '../../../../../domain/core/abstractions/http_connect.interface.dart';
import '../../../../../domain/core/exceptions/default.exception.dart';
import '../../../usecase/messages.services.interface.dart';
import 'message.response.model.dart';

class MessagesNetworkServices extends IMessagesServices {
  final IHttpConnect _connect;

  MessagesNetworkServices({required IHttpConnect connect}) : _connect = connect;

  String get _prefix => 'messages';

  @override
  Future<MessagesResponseModel> getMessages({required int page}) async {
    try {
      final response = await _connect.get<MessagesResponseModel>(
        '$_prefix?page=$page',
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          // 'user-Agent': 'PostmanRuntime/7.29.2',
        },
        decoder: (value) {
          return MessagesResponseModel.fromJson(
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
