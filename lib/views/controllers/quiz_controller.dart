import 'package:get/get.dart';

class QuizController extends GetxController{
  var index = 1.obs;
  var totalIndex = 5;
  var choice = 0.obs;

  var answers = [].obs;

  void nextPage(){
    index++;
  }

  void prevPage(){
    index--;
  }

  String detailPage(){
    return '$index dari $totalIndex';
  }

  void setChoice(int choice){
    this.choice.value = choice;
  }
}