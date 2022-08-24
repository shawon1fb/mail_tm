// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mail_tm/domain/core/pagination/pagination_model.dart';
import 'package:mail_tm/domain/repository/usecases/domain.repository.interface.dart';
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
}
