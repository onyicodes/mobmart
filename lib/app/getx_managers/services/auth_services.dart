import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobmart/core/keys/cache_keys.dart';

class AuthService extends GetxService {
  GetStorage storeBox = GetStorage();

  bool isLoggedIn() {
    String lastUserId = storeBox.read(CacheKeys.lastUserID) ?? "";
    bool isLoggedIn = storeBox.read<bool>(CacheKeys.isLoggedIn(lastUserId))??false;
    String token = storeBox.read<String>(CacheKeys.accessToken(lastUserId))??"";
    String refreshToken =
        storeBox.read<String>(CacheKeys.refreshToken(lastUserId))??"";

    
    return (isLoggedIn &&
        token.isNotEmpty &&
        refreshToken.isNotEmpty);
  }

  bool hasOnboarded() {
    String lastUserId = storeBox.read(CacheKeys.lastUserID) ?? "";
    bool userOnboarded = storeBox.read(CacheKeys.hasOnboarded(lastUserId))??false;
    return  userOnboarded;
  }
}
