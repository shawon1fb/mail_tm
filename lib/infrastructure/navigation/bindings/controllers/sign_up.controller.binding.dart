import 'package:get/get.dart';

import '../../../../domain/repository/domains/domain.repository.dart';
import '../../../../presentation/sign_up/controllers/doman.controller.dart';
import '../../../../presentation/sign_up/controllers/sign_up.controller.dart';
import '../domains/domains.repository.bindings.dart';

class SignUpControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );

    Get.put<DomainController>(
      DomainController(domainRepository: DomainRepositoryBindings().repository),
    );
  }
}
