import '../services/domains/models/domains.response.model.dart';

abstract class IDomainServices {
  Future<DomainsResponse> getDomains();
}
