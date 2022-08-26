import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'infrastructure/navigation/routes.dart';
import 'presentation/shared/no_internet_widget/no_internet_controller.dart';

import 'config.dart';

class Initializer {
  static Future<void> init() async {
    try {
      await _initStorage();
      await _initGetConnect();

      _initGlobalInternetConnection();
      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> testInit() async {
    try {
      await _initGetConnect();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initGetConnect() async {
    final connect = GetConnect();
    final url = ConfigEnvironments.getEnvironments()['url'];
    connect.baseUrl = url;
    connect.timeout = const Duration(seconds: 300);
    connect.httpClient.maxAuthRetries = 0;

    connect.httpClient.addRequestModifier<dynamic>(
      (request) {
        // debugPrint('request:=> ${request.url}');
        return request;
      },
    );

    connect.httpClient.addResponseModifier(
      (request, response) async {
        debugPrint('request:=> ${request.url}');
        debugPrint('status:=> ${response.statusCode}');

        try {
          Map<String, dynamic> j = json.decode(response.bodyString ?? '');
          String res = const JsonEncoder.withIndent('  ').convert(j);

          debugPrint('');
          debugPrint('response $res');
        } catch (e) {
          debugPrint('error GetConnect:=> ${e.toString()}');
          debugPrint('error GetConnect:=> ${response.bodyString}');
        }
        if (response.statusCode == 401) {
          Get.offAllNamed(Routes.LOGIN);
        }

        return response;
      },
    );

    Get.put(connect);
  }

  static void _initGlobalInternetConnection() {
    final connection = NoInternetController(connectivity: Connectivity());
    Get.put(connection, permanent: true);
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
    Get.put(GetStorage());
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
