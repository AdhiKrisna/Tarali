import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var isSearching = false.obs;
  var searchController = TextEditingController();
  void toggleSearch() {
    isSearching.value = !isSearching.value;
  }
  
}