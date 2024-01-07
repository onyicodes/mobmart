import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mobmart/app/getx_managers/services/auth_services.dart';
import 'package:mobmart/core/network/network_info.dart';

initializeGetX() async {
  Get.deleteAll(force: true);

  Get.put(GetStorage(), permanent: true);
  Get.put(AuthService(), permanent: true);
  Get.put(FirebaseFirestore.instance, permanent: true);
  Get.put(const FlutterSecureStorage(), permanent: true);
  Get.put<NetworkInfo>(NetworkInfoImpl(InternetConnection()), permanent: true);
}
