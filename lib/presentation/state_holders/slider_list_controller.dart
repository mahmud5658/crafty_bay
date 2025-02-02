import 'package:crafty_bay/Data/model/network_response.dart';
import 'package:crafty_bay/Data/model/slider_list_model.dart';
import 'package:crafty_bay/Data/model/slider_model.dart';
import 'package:crafty_bay/Data/service/network_caller.dart';
import 'package:crafty_bay/Data/utils/urls.dart';
import 'package:get/get.dart';

class SliderListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  List<SliderModel> _sliderList = [];
  List<SliderModel> get sliders => _sliderList;
  Future<bool> getSliderList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: Urls.sliderListUrl);
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _sliderList = SliderListModel.fromJson(response.responseData).sliderList ?? [];
    } else {
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
