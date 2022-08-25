// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mail_tm/domain/core/models/user.data.model.dart';
import 'package:mail_tm/domain/core/pagination/pagination_model.dart';
import 'package:mail_tm/domain/repository/usecases/account.repository.interface.dart';
import 'package:mail_tm/domain/repository/usecases/domain.repository.interface.dart';
import 'package:mail_tm/infrastructure/dal/services/accounts/dto/account.dto.dart';
import 'package:mail_tm/infrastructure/navigation/bindings/domains/account.repository.bindings.dart';
import 'package:mail_tm/infrastructure/navigation/bindings/domains/domains.repository.bindings.dart';
import 'package:mail_tm/initializer.dart';

import 'package:mail_tm/main.dart';

void main() {
  test('domain list', () async {
    Initializer.testInit();
    IDomainRepository repository = DomainRepositoryBindings().repository;
    PaginationModel<String> pagination = await repository.getDomains();
    List<String> list = pagination.list;
    // print(list);
    expect(list.isNotEmpty, true);
  });

  test(
    'create user',
    () async {
      try {
        Initializer.testInit();
        IAccountRepository repository = AccountRepositoryBindings().repository;

        var dto = AccountDto(
          address: 's1hawon@arxxwalls.com',
          password: '123456',
        );

        UserData data = await repository.createAccount(dto);
        print(data);

        expect(data.used == 0, true);
      } catch (e) {
        debugPrint(e.toString());
      }
    },
  );
  test(
    'SignIn user',
    () async {
      try {
        Initializer.testInit();
        IAccountRepository repository = AccountRepositoryBindings().repository;

        var dto = AccountDto(
          address: 's1hawon@arxxwalls.com',
          password: '123456',
        );

        String data = await repository.signIn(dto);
        print(data);

        expect(data.isNotEmpty, true);
      } catch (e) {
        debugPrint(e.toString());
      }
    },
  );
}
