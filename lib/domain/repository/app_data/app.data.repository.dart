import '../../../infrastructure/dal/usecase/app.data.services.interface.dart';
import '../usecases/app.data.repository.interface.dart';

class AppDataRepository extends IAppDataRepository {
  final IAppDataService _service;

  AppDataRepository({required IAppDataService service}) : _service = service;

  @override
  Future<String> getJwtToken() async {
    try {
      return _service.getJwtToken();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setJwtToken(String jwtToken) async {
    try {
      return _service.setJwtToken(jwtToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> clearJwtToken() {
    try {
      return _service.clearJwtToken();
    } catch (e) {
      rethrow;
    }
  }
}
