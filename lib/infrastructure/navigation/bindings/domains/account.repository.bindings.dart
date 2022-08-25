import 'package:get/get.dart';

import '../../../../domain/repository/accounts/account.repository.dart';
import '../../../../domain/repository/usecases/account.repository.interface.dart';
import '../../../dal/services/accounts/account.network.services.dart';
import '../../../dal/services/connect.dart';

class AccountRepositoryBindings {
  late IAccountRepository _repository;

  IAccountRepository get repository => _repository;

  AccountRepositoryBindings() {
    final getConnect = Get.find<GetConnect>();
    final connect = Connect(connect: getConnect);
    final services = AccountNetworkService(connect: connect);
    _repository = AccountRepository(service: services);
  }
}
