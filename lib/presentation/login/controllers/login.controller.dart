import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/core/exceptions/forbidden.exception.dart';
import '../../../domain/repository/usecases/account.repository.interface.dart';
import '../../../domain/repository/usecases/app.data.repository.interface.dart';
import '../../../infrastructure/dal/services/accounts/dto/account.dto.dart';

class LoginController extends GetxController {
  final IAccountRepository _accountRepository;
  final IAppDataRepository _appDataRepository;

  LoginController(
      {required IAccountRepository accountRepository,
      required IAppDataRepository appDataRepository})
      : _accountRepository = accountRepository,
        _appDataRepository = appDataRepository;

  Future<void> loginMethod(
      {required String address, required String password}) async {
    try {
      AccountDto dto = AccountDto(address: address, password: password);
      String token = await _accountRepository.signIn(dto);
      // debugPrint(token);
      ///save token to local storage
      await _appDataRepository.setJwtToken(token);
    } catch (e, t) {
      debugPrint(e.toString());
      debugPrint(t.toString());
      rethrow;
    }
  }
}
