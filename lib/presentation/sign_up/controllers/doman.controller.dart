import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/pagination/pagination_model.dart';
import '../../../domain/repository/usecases/domain.repository.interface.dart';

class DomainController extends GetxController {
  final IDomainRepository _domainRepository;

  DomainController({required IDomainRepository domainRepository})
      : _domainRepository = domainRepository;

  @override
  void onInit() {
    getDomainsName();
    super.onInit();
  }

  Future<void> getDomainsName() async {
    try {
      PaginationModel<String> result = await _domainRepository.getDomains();
      domainNames.value = result.list;
    } catch (e, t) {
      debugPrint(e.toString());
      debugPrint(t.toString());
    }
  }

  RxInt selectedIndex = (-1).obs;
  RxList<String> domainNames = <String>[].obs;

  @override
  void onClose() {
    selectedIndex.close();
    domainNames.close();
    super.onClose();
  }
}
