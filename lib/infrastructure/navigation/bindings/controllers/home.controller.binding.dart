import 'package:get/get.dart';

import '../../../../domain/repository/messages/message.repository.dart';
import '../../../../presentation/home/controllers/home.controller.dart';
import '../domains/app.data.repository.bindings.dart';
import '../domains/messages.repository.bindings.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        messageRepository: MessagesRepositoryBindings().repository,
        appDataRepository: AppDataRepositoryBinding().repository,
      ),
    );
  }
}
