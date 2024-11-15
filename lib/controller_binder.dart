import 'package:crafty_bay/data/service/network_caller.dart';
import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/second_counter_controller.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
 Get.lazyPut(()=>SecondCounterController());
 Get.lazyPut(()=>BottomNavBarController());
 Get.put(Logger());
 Get.put(NetworkCaller(logger:Get.find<Logger>()));
 Get.lazyPut(()=> SliderListController());
 Get.lazyPut(()=> CategoryListController());
  }
}