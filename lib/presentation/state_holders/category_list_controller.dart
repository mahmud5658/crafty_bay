import 'package:crafty_bay/Data/model/category_list_model.dart';
import 'package:crafty_bay/Data/model/category_model.dart';
import 'package:get/get.dart';
import '../../Data/model/network_response.dart';
import '../../Data/service/network_caller.dart';
import '../../Data/utils/Urls.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categories => _categoryList;
  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(url: Urls.cateGoryListUrl);
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _categoryList = CategoryListModel.fromJson(response.responseData).categoryList??[];
    } else {
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}