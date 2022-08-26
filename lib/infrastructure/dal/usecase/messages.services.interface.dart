import '../services/messages/model/message.response.model.dart';

abstract class IMessagesServices {
  Future<MessagesResponseModel> getMessages({required int page});
}
