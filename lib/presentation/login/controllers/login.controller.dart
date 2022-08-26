import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/repository/usecases/account.repository.interface.dart';
import '../../../infrastructure/dal/services/accounts/dto/account.dto.dart';

class LoginController extends GetxController {
  final IAccountRepository _accountRepository;

  LoginController({required IAccountRepository accountRepository})
      : _accountRepository = accountRepository;

  Future<void> loginMethod(
      {required String address, required String password}) async {
    try {
      AccountDto dto = AccountDto(address: address, password: password);
      String token = await _accountRepository.signIn(dto);
      debugPrint(token);

      ///save token to local storage

    } catch (e, t) {
      debugPrint(e.toString());
      debugPrint(t.toString());
    }
  }
}
