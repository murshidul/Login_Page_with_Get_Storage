import 'package:get_storage/get_storage.dart';

class StorageUtils {
  static final _storage = GetStorage();

  static final _loginKey = "loginKey";

  static bool isFirstTimeLogin() {
    return _storage.read(_loginKey) ?? true;
  }

  static void setLoginData(bool value) {
    _storage.write(_loginKey, value);
  }
}
