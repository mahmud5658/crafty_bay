import 'package:crafty_bay/presentation/utils/second_counter.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
 Get.lazyPut(()=>SecondCounter());
  }
}