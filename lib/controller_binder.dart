import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/second_counter_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
 Get.lazyPut(()=>SecondCounterController());
 Get.lazyPut(()=>BottomNavBarController());
  }
}