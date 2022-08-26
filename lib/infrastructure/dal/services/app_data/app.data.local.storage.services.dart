import '../../../../domain/core/abstractions/storage.interface.dart';
import '../../../../domain/core/exceptions/not_found.exception.dart';
import '../../usecase/app.data.services.interface.dart';

class AppDataLocalStoreService extends IAppDataService {
  final IStorage _storage;

  AppDataLocalStoreService({required IStorage storage}) : _storage = storage;

  @override
  Future<String> getJwtToken() async {
    try {
      String? token = await _storage.read('jwtToken');
      if (token == null) {
        throw NotFoundException(message: 'Token not found');
      }
      return token;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setJwtToken(String jwtToken) async {
    try {
      await _storage.write(key: 'jwtToken', value: jwtToken);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> clearJwtToken() async {
    try {
      await _storage.delete('jwtToken');
    } catch (e) {
      rethrow;
    }
  }
}
