import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LandingController extends GetxController {
  

  LandingController();

  final _currentPageIndex = 0.obs;
  final _screenWidth = 600.0.obs;
  final _lastExitTime = DateTime.now().obs;

  int get currentPageIndex => _currentPageIndex.value;
  double get screenWidth => _screenWidth.value;
  DateTime get lastExitTime => _lastExitTime.value;

  set currentPageIndex(value) => _currentPageIndex.value = value;
  set screenWidth(value) => _screenWidth.value = value;
  set lastExitTime(value) => _lastExitTime.value = value;

  pressToExit() {}
}
