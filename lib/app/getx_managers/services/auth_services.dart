import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobmart/core/keys/cache_keys.dart';

class AuthService extends GetxService {
  GetStorage storeBox = GetStorage();

  bool isLoggedIn() {
    bool? accessToken = storeBox.read(CacheKeys.isLoggedIn);
    return accessToken ?? false;
  }

  bool hasOnboarded() {
    bool userOnboarded = storeBox.read(CacheKeys.hasOnboarded)??false;
    return  userOnboarded;
  }
}
