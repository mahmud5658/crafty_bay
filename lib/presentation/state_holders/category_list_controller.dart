import 'package:crafty_bay/data/Utils/urls.dart';
import 'package:crafty_bay/data/models/category_list_model.dart';
import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/slider_list_model.dart';
import 'package:crafty_bay/data/models/slider_model.dart';
import 'package:crafty_bay/data/service/network_caller.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  List<CategoryModel> _categoryList = [];
  String? get errorMessage => _errorMessage;
  List<CategoryModel> get categoryList => _categoryList;
  bool get inProgress => _inProgress;

  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(url: Urls.categoryListUrl);
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _categoryList = CategoryListModel.fromJson(response.responseData).categoryList?? [];
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
