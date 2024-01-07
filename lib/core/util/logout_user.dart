import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobmart/app/routes/app_pages.dart';
import 'package:mobmart/core/keys/cache_keys.dart';
import 'package:mobmart/core/util/CustomSmartLoading.dart';

logUserOut({required GetStorage storeBox}) async {
  String lastUserId = storeBox.read(CacheKeys.lastUserID) ?? "";

  customSmartLoading(loading: true, message: "signing out..");

  await Future.delayed(const Duration(seconds: 1));
  await storeBox.write(CacheKeys.isLoggedIn(lastUserId), false);
  await storeBox.remove(CacheKeys.accessToken(lastUserId));
  await storeBox.remove(CacheKeys.userData(lastUserId));
  await storeBox.remove(CacheKeys.accountType(lastUserId));

  Get.offAllNamed(Routes.signin);
  customSmartLoading(loading: false, message: "signing out..");
}
