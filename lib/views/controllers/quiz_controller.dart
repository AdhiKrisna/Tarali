import 'package:get/get.dart';

class QuizController extends GetxController{
  var index = 0.obs;
  var totalIndex = 0;
  var choice = 0.obs;

  var answers = [].obs;

  void nextPage(){
    if(index.value < totalIndex - 1){
      index.value++;
    }
  }

  void prevPage(){
    if(index.value > 0){
      index.value--;
    }
  }

  String detailPage(){
    return '${index.value + 1} dari $totalIndex';
  }

  void setChoice(int choice){
    this.choice.value = choice;
  }
}