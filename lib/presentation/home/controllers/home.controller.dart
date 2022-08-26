import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../domain/core/models/messages.data.model.dart';
import '../../../domain/core/pagination/pagination_model.dart';
import '../../../domain/repository/usecases/app.data.repository.interface.dart';
import '../../../domain/repository/usecases/message.repository.interface.dart';
import '../../../infrastructure/navigation/routes.dart';

class HomeController extends GetxController {
  final IMessageRepository _messageRepository;
  final IAppDataRepository _appDataRepository;

  HomeController(
      {required IMessageRepository messageRepository,
      required IAppDataRepository appDataRepository})
      : _messageRepository = messageRepository,
        _appDataRepository = appDataRepository;

  @override
  void onInit() {
    refreshMessages();
    super.onInit();
  }

  int _page = 1;

  Future<void> refreshMessages() async {
    _page = 1;
    getMessages();
  }

  Future<void> getMessages() async {
    try {
      PaginationModel<MessageDataModel> result =
          await _messageRepository.getMessages(page: _page);

      _page = result.nextPage;
      if (_page == 1) {
        messages.clear();
      }

      for (int i = 0; i < result.list.length; i++) {
        MessageDataModel message = result.list[i];
        if (!messages.contains(message)) {
          messages.add(message);
        }
      }
      update(<Object>['messages_list']);
    } catch (e, t) {
      debugPrint(e.toString());
      debugPrint(t.toString());
    }
  }

  List<MessageDataModel> messages = <MessageDataModel>[];

  Future<void> logoutMethod() async {
    try {
      await _appDataRepository.clearJwtToken();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
