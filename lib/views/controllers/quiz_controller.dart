import 'package:get/get.dart';

class QuizController extends GetxController{
  var index = 0.obs;
  var totalIndex = 0;
  var choice = [].obs;

  var answers = [].obs;

  void setData({required int lengthData}){
    totalIndex = lengthData;
    print(totalIndex);
    for(int i = 0; i < totalIndex; i++){
      choice.add(-1.obs);
    }
  }

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
    this.choice[index.value] = choice;
  }
}