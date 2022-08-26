import '../../../infrastructure/dal/services/messages/model/message.response.model.dart';
import '../../../infrastructure/dal/usecase/messages.services.interface.dart';
import '../../core/models/messages.data.model.dart';
import '../../core/pagination/pagination_model.dart';
import '../usecases/message.repository.interface.dart';

class MessageRepository extends IMessageRepository {
  final IMessagesServices _service;

  MessageRepository({required IMessagesServices service}) : _service = service;

  @override
  Future<PaginationModel<MessageDataModel>> getMessages(
      {required int page}) async {
    try {
      MessagesResponseModel response = await _service.getMessages(page: page);

      List<MessageDataModel> messages = <MessageDataModel>[];
      for (int i = 0; i < (response.hydraMember?.length ?? 0); i++) {
        var item = response.hydraMember![i];

        FromUser from = FromUser(
          name: item.from!.name!,
          address: item.from!.address!,
        );

        List<FromUser> to = <FromUser>[];
        for (int j = 0; j < (item.to?.length ?? 0); j++) {
          to.add(FromUser(
            name: item.to![j].name!,
            address: item.to![j].address!,
          ));
        }

        MessageDataModel model = MessageDataModel(
          intro: item.intro!,
          createdAt: item.createdAt!,
          to: to,
          subject: item.subject!,
          seen: item.seen!,
          from: from,
          id: item.id!,
        );

        messages.add(model);
      }

      return PaginationModel<MessageDataModel>(
        list: messages,
        maxPage: -1,
        nextPage: messages.isEmpty ? page : page + 1,
      );
    } catch (e) {
      rethrow;
    }
  }
}
