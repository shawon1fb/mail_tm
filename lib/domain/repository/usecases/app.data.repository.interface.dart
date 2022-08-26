abstract class IAppDataRepository {
  Future<String> getJwtToken();

  Future<void> setJwtToken(String jwtToken);

  Future<void> clearJwtToken();
}
