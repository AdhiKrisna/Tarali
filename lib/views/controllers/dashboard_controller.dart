import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/services/content_service.dart';

class DashboardController extends GetxController {
  var isSearching = false.obs;
  var searchController = TextEditingController();
  var cs = ContentService();
  // final storageRef = FirebaseStorage.instance.ref();

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
  void toggleSearch() {
    isSearching.value = !isSearching.value;
  }

  void searchContent() {
    if (searchController.text.isNotEmpty) {
      print(searchController.text + ' from controller');
      cs.getSearchContent(searchController.text).listen((event) {
        print(event);
      });
    }
    else {
      print('Search is empty');
    }
  }
}