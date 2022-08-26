import 'package:get/get.dart';

import '../../../../domain/repository/messages/message.repository.dart';
import '../../../../domain/repository/usecases/message.repository.interface.dart';
import '../../../dal/services/connect.dart';
import '../../../dal/services/messages/model/mesage.network.services.dart';

class MessagesRepositoryBindings {
  late IMessageRepository _repository;

  IMessageRepository get repository => _repository;

  MessagesRepositoryBindings() {
    final getConnect = Get.find<GetConnect>();
    final connect = Connect(connect: getConnect);
    final services = MessagesNetworkServices(connect: connect);
    _repository = MessageRepository(service: services);
  }
}
