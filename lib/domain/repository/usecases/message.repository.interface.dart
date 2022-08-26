import '../../core/models/messages.data.model.dart';
import '../../core/pagination/pagination_model.dart';

abstract class IMessageRepository {
  Future<PaginationModel<MessageDataModel>> getMessages({required int page});
}
