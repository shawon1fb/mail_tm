import '../../../infrastructure/dal/services/accounts/dto/account.dto.dart';
import '../../../infrastructure/dal/services/accounts/model/token.response.model.dart';
import '../../../infrastructure/dal/services/accounts/model/user.response.model.dart';
import '../../../infrastructure/dal/usecase/account.services.interface.dart';
import '../../core/models/user.data.model.dart';
import '../usecases/account.repository.interface.dart';

class AccountRepository extends IAccountRepository {
  final IAccountService _service;

  AccountRepository({required IAccountService service}) : _service = service;

  UserData _contUserData(UserResponse response) {
    try {
      UserData data = UserData(
        quota: response.quota!,
        context: response.context!,
        used: response.used!,
        isDeleted: response.isDeleted!,
        id: response.id!,
        address: response.address!,
        isDisabled: response.isDisabled!,
        type: response.type!,
        createdAt: response.createdAt!,
        updatedAt: response.updatedAt!,
      );

      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserData> createAccount(AccountDto dto) async {
    try {
      UserResponse response = await _service.createAccount(dto);
      return _contUserData(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signIn(AccountDto dto) async {
    try {
      TokenResponse response = await _service.signIn(dto);
      return response.token!;
    } catch (e) {
      rethrow;
    }
  }
}
