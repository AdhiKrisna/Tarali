import 'package:get/get.dart';
import 'package:tarali/constants/api_keys.dart';
import 'package:tarali/models/speech_model.dart';
import 'package:tarali/services/speech_to_text.dart';

class SpeechController extends GetxController {
  final SpeechToTextService speechService = SpeechToTextService(projectId: projectID, credentialsJsonPath: credentialJsonPath);
  var model = SpeechModel().obs;

  Future<void> transcribeFromFile(String filePath) async {
     model.update((val) {
      val?.setIsTranscribing(true); // Set status menjadi sedang transkripsi
      val?.setError(''); // Reset error sebelum memulai transkripsi
    });

    try {
      final transcription = await speechService.transcribeAudioFile(filePath);
      model.update((val) {
        val?.setTranscript(transcription); // Set hasil transkripsi
        val?.setIsTranscribing(false); // Set status menjadi tidak sedang transkripsi
      });
    } catch (e) {
      model.update((val) {
        val?.setError(e.toString()); // Set error jika ada
        val?.setIsTranscribing(false); // Set status menjadi tidak sedang transkripsi
      });
    }
  }

  Future<void>  transcribeFromRecording() async {
      model.update((val) {
      val?.setIsTranscribing(true); // Set status menjadi sedang transkripsi
      val?.setError(''); // Reset error sebelum memulai transkripsi
    });

    try {
      final transcription = await speechService.transcribeRecording();
      model.update((val) {
        val?.setTranscript(transcription); // Set hasil transkripsi
        val?.setIsTranscribing(false); // Set status menjadi tidak sedang transkripsi
      });
    } catch (e) {
      model.update((val) {
        val?.setError(e.toString()); // Set error jika ada
        val?.setIsTranscribing(false); // Set status menjadi tidak sedang transkripsi
      });
    }
  }
}
