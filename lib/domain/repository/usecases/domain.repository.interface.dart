import '../../core/pagination/pagination_model.dart';

abstract class IDomainRepository {
  Future<PaginationModel<String>> getDomains();
}
