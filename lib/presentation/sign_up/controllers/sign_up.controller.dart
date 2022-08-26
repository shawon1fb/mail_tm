import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/core/models/user.data.model.dart';
import '../../../domain/repository/usecases/account.repository.interface.dart';
import '../../../infrastructure/dal/services/accounts/dto/account.dto.dart';

class SignUpController extends GetxController {
  final IAccountRepository _accountRepository;

  SignUpController({required IAccountRepository accountRepository})
      : _accountRepository = accountRepository;

  Future<void> signUpMethod({required AccountDto dto}) async {
    try {
      print(dto.toString());
      UserData user = await _accountRepository.createAccount(dto);
      debugPrint(user.toString());
    } catch (e) {
      rethrow;
    }
  }
}
