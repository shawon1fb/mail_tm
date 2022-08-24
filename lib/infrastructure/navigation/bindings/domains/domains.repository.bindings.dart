import 'package:get/get.dart';

import '../../../../domain/repository/domains/domain.repository.dart';
import '../../../../domain/repository/usecases/domain.repository.interface.dart';
import '../../../dal/services/connect.dart';
import '../../../dal/services/domains/domains.network.service.dart';

class DomainRepositoryBindings {
  late IDomainRepository _repository;

  IDomainRepository get repository => _repository;

  DomainRepositoryBindings() {
    final getConnect = Get.find<GetConnect>();
    final connect = Connect(connect: getConnect);
    final domainServices = DomainsNetworkServices(connect: connect);
    _repository = DomainRepository(domainServices: domainServices);
  }
}
