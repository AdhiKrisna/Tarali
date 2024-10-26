import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:tarali/routes/route_name.dart';

class QuizController extends GetxController{
  var index = 0.obs;
  var totalIndex = 0;
  var choice = [].obs;
  var answers = [].obs;
  var imageUrl = ''.obs;

  void setData({required int lengthData}){
    totalIndex = lengthData;
    print(totalIndex);
    for(int i = 0; i < totalIndex; i++){
      choice.add(-1.obs);
      print(choice);
    }
  }

  void setImageUrl({required String url}){
    imageUrl.value = url;
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

  void setAnswer(){
    answers.clear();
    for(int i = 0; i < totalIndex; i++){
      answers.add(choice[i]);
    }
  }

  void scoring(kunciJawaban, argument){
    setAnswer();
    int benar = 0;
    for(int i = 0; i < totalIndex; i++){
      if(answers[i] == kunciJawaban[i].jawaban){
        print(kunciJawaban[i].jawaban);
        print('Benar');
        benar += 1;
      }
    }
    print('Jumlah benar : $benar');
    double score = (benar / totalIndex * 100);
    score += 5.76;
    print('Score : $score');
    argument['benar'] = benar;
    argument['quizScore'] = score;
    argument['totalSoal'] = totalIndex;
    Get.offNamed(RouteName.quizResultPage, arguments: argument);
  }
}