import 'package:db_miner/screen/category_model/category_model.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:db_miner/utils/json_helper.dart';
import 'package:db_miner/utils/share_helper.dart';
import 'package:get/get.dart';

import '../model/home_model.dart';

class HomeController extends GetxController {
  RxList<HomeModel> list = <HomeModel>[].obs;
  RxList<categoryModel> l1 = <categoryModel>[].obs;
  RxBool isLight = false.obs;
  Future<void> quotesGetData() async {
    List<HomeModel>? l1 = await JsonHelper.helper.getData();
    list.value = l1!;
  }

  Future<void> quotesCategory() async {
    List<categoryModel>? c1 = await DBHelper.helper.readCategory();
    l1.value = c1!;
    print(l1.value);
  }

  void changeTheme() async {
    ShareHelper shr = ShareHelper.helper;
    bool? isTheme = await shr.applyTheme();
    isLight.value = isTheme ?? false;
  }
}
