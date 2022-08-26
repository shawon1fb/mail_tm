import 'bindings/domains/app.data.repository.bindings.dart';

class Routes {
  static Future<String> get initialRoute async {
    try {
      String token = await AppDataRepositoryBinding().repository.getJwtToken();

      if (token.isNotEmpty) {
        return HOME;
      } else {
        return LOGIN;
      }
    } catch (err) {
      return LOGIN;
    }

    // TODO: implement method
    return LOGIN;
  }

  static const HOME = '/home';
  static const LOGIN = '/login';
  static const SIGN_UP = '/sign-up';
}
