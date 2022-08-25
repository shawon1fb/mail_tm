import '../../../infrastructure/dal/services/accounts/dto/account.dto.dart';
import '../../core/models/user.data.model.dart';

abstract class IAccountRepository {
  Future<UserData> createAccount(AccountDto dto);

  Future<String> signIn(AccountDto dto);
}
