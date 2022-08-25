import 'dart:convert';

import '../../../../domain/core/abstractions/http_connect.interface.dart';
import '../../../../domain/core/exceptions/default.exception.dart';
import '../../../../domain/core/exceptions/unprocessable.entity.exception.dart';
import '../../usecase/account.services.interface.dart';
import 'dto/account.dto.dart';
import 'model/token.response.model.dart';
import 'model/user.response.model.dart';

class AccountNetworkService extends IAccountService {
  final IHttpConnect _connect;

  AccountNetworkService({required IHttpConnect connect}) : _connect = connect;

  String get _prefix => 'accounts';

  @override
  Future<UserResponse> createAccount(AccountDto dto) async {
    try {
      final response = await _connect.post<UserResponse>(
        _prefix,
        dto.toString(),
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          // 'user-Agent': 'PostmanRuntime/7.29.2',
        },
        decoder: (value) {
          // print(value);
          return UserResponse.fromJson(
            value is String ? jsonDecode(value) : value as Map<String, dynamic>,
          );
        },
      );
      if (response.success) {
        return response.payload!;
      } else {
        switch (response.statusCode) {
          case 422:
            throw UbProcessAbleEntityException(
                message:
                    response.payload?.error ?? 'UbProcessAbleEntityException');
          case 500:
            throw DefaultException(
              message: response.payload?.error ?? 'Server error',
            );
          default:
            throw DefaultException(
              message: response.payload?.error ??
                  'Error loading data, check your internet!',
            );
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TokenResponse> signIn(AccountDto dto) async {
    try {
      final response = await _connect.post<TokenResponse>(
        'token',
        dto.toString(),
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          // 'user-Agent': 'PostmanRuntime/7.29.2',
        },
        decoder: (value) {
          // print(value);
          return TokenResponse.fromJson(
            value is String ? jsonDecode(value) : value as Map<String, dynamic>,
          );
        },
      );
      if (response.success) {
        return response.payload!;
      } else {
        switch (response.statusCode) {
          case 422:
            throw UbProcessAbleEntityException(
                message:
                    response.payload?.message ?? 'UbProcessAbleEntityException');
          case 500:
            throw DefaultException(
              message: response.payload?.message ?? 'Server error',
            );
          default:
            throw DefaultException(
              message: response.payload?.message ??
                  'Error loading data, check your internet!',
            );
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
