import 'package:get/get.dart';
import 'package:tarali/constants/api_keys.dart';
import 'package:tarali/models/speech_model.dart';
import 'package:tarali/services/speech_to_text.dart';

class SpeechController extends GetxController {
  final SpeechToTextService speechService = SpeechToTextService(projectId: projectID, credentialsJsonPath: credentialJsonPath);
  var model = SpeechModel().obs;

  Future<void> transcribeFromFile(String filePath) async {
     model.update((val) {
      val?.setIsTranscribing(true); 
      val?.setError(''); 
    });

    try {
      final transcription = await speechService.transcribeAudioFile(filePath);
      model.update((val) {
        val?.setTranscript(transcription); 
        val?.setIsTranscribing(false); 
      });
    } catch (e) {
      model.update((val) {
        val?.setError(e.toString()); 
        val?.setIsTranscribing(false); 
      });
    }
  }

  Future<void>  transcribeFromRecording() async {
      model.update((val) {
      val?.setIsTranscribing(true); 
      val?.setError(''); 
    });

    try {
      final transcription = await speechService.transcribeRecording();
      model.update((val) {
        val?.setTranscript(transcription); 
        val?.setIsTranscribing(false); 
      });
    } catch (e) {
      model.update((val) {
        val?.setError(e.toString()); 
        val?.setIsTranscribing(false); 
      });
    }
  }
}
