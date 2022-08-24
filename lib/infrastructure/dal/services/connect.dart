import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import '../../../domain/core/abstractions/http_connect.interface.dart';
import '../../../domain/core/abstractions/response.model.dart';
import '../../../domain/core/exceptions/no_internet.exception.dart';

class Connect implements IHttpConnect {
  final GetConnect _connect;

  const Connect({required GetConnect connect}) : _connect = connect;

  @override
  Future<Response<T>> get<T>(
    String url, {
    required T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _connect.get(
        url,
        decoder: decoder,
        headers: headers,
        contentType: 'application/json',
        query: query,

      );
      if (response.statusCode == null) {
        throw NotInternetException(message: url);
      }

      final obj = Response(
        statusCode: response.statusCode!,
        payload: response.body,
      );
      return obj;
    } catch (e) {
      debugPrint(e.runtimeType.toString());
      rethrow;
    }
  }

  @override
  Future<Response<T>> post<T>(
    String url,
    dynamic body, {
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _connect.post(
        url,
        body,
        decoder: decoder,
        headers: headers,
        query: query,
      );

      debugPrint(response.hasError.toString());
      response.printError();
      debugPrint(response.status.code.toString());
      if (response.statusCode == null) {
        throw NotInternetException();
      }

      final obj = Response(
        statusCode: response.statusCode!,
        payload: response.body,
      );
      return obj;
    } catch (e) {
      debugPrint('${e.runtimeType}');
      rethrow;
    }
  }

  @override
  Future<Response<T>> patch<T>(
    String url,
    Map<String, dynamic> body, {
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _connect.patch(
        url,
        body,
        decoder: decoder,
        headers: headers,
      );
      final obj = Response(
        statusCode: response.statusCode!,
        payload: response.body,
      );
      if (response.statusCode == null) {
        throw NotInternetException();
      }

      return obj;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _connect.delete(
        url,
        decoder: decoder,
        headers: headers,
      );
      final obj = Response(
        statusCode: response.statusCode!,
        payload: response.body,
      );
      if (response.statusCode == null) {
        throw NotInternetException();
      }

      return obj;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response<T>> put<T>(
    String url,
    Map<String, dynamic> body, {
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _connect.put(
        url,
        body,
        decoder: decoder,
        headers: headers,
      );
      final obj = Response(
        statusCode: response.statusCode!,
        payload: response.body,
      );
      if (response.statusCode == null) {
        throw NotInternetException();
      }

      return obj;
    } catch (e) {
      rethrow;
    }
  }
}
