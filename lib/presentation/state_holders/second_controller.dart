import 'package:get/get.dart';

class SecondController extends GetxController {
  late int remainingSecond;
  Future<void> setAndDecreaseTime() async {
    for (remainingSecond = 60; remainingSecond > 0;) {
      await Future.delayed(const Duration(seconds: 1));
      remainingSecond--;
      update();
    }
  }
  bool get canResendCode => remainingSecond == 0;
}
