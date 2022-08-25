import '../services/accounts/dto/account.dto.dart';
import '../services/accounts/model/token.response.model.dart';
import '../services/accounts/model/user.response.model.dart';

abstract class IAccountService {
  Future<UserResponse> createAccount(AccountDto dto);

  Future<TokenResponse> signIn(AccountDto dto);
}
