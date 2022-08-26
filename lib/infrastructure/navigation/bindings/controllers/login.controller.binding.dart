import 'package:get/get.dart';

import '../../../../presentation/login/controllers/login.controller.dart';
import '../domains/account.repository.bindings.dart';
import '../domains/app.data.repository.bindings.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        accountRepository: AccountRepositoryBindings().repository,
        appDataRepository: AppDataRepositoryBinding().repository,
      ),
    );
  }
}
