import 'package:get/get.dart';

class ToggleController extends GetxController {
  var isSearching = false.obs;
  void toggleSearch() {
    isSearching.value = !isSearching.value;
  }
  
}