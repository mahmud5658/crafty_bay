import 'package:crafty_bay/presentation/state_holders/second_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecondController());
  }
}
