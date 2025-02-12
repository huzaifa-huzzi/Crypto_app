import 'package:get/get.dart';



class SelectCoinController extends GetxController {
  var selectedTabIndex = 2.obs;


  final List<String> tabs = ['D', 'W', 'M', '3M', '6M', 'Y'];

  void updateSelectedTab(int index) {
    selectedTabIndex.value = index;
  }
}
