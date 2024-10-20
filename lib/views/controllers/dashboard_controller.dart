import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/services/content_service.dart';

class DashboardController extends GetxController {
  var isSearching = false.obs;
  var searchController = TextEditingController();
  var cs = ContentService();
  // final storageRef = FirebaseStorage.instance.ref();

  void toggleSearch() {
    isSearching.value = !isSearching.value;
  }
}