import '../../../infrastructure/dal/services/domains/models/domains.response.model.dart';
import '../../../infrastructure/dal/usecase/domains.services.interface.dart';
import '../../core/pagination/pagination_model.dart';
import '../usecases/domain.repository.interface.dart';

class DomainRepository extends IDomainRepository {
  final IDomainServices _domainServices;

  DomainRepository({required IDomainServices domainServices})
      : _domainServices = domainServices;

  @override
  Future<PaginationModel<String>> getDomains() async {
    try {
      DomainsResponse response = await _domainServices.getDomains();
      List<String> domainNames = <String>[];
      for (int i = 0; i < (response.hydraMember?.length ?? 0); i++) {
        var item = response.hydraMember![i];
        if (item.domain != null) {
          domainNames.add(item.domain!);
        }
      }

      PaginationModel<String> model = PaginationModel<String>(
        nextPage: 1,
        list: domainNames,
        maxPage: 1,
      );
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
