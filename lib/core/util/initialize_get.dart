import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobmart/app/getx_managers/services/auth_services.dart';


initializeGetX() async{
  Get.deleteAll(force: true);
  
  Get.put(GetStorage(),permanent: true);
  Get.put(AuthService(),permanent: true);
  Get.put(const FlutterSecureStorage(), permanent: true);
  
}