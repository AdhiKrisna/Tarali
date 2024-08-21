
import 'package:tarali/models/speech_model.dart';
import 'package:tarali/services/speech_to_text.dart';

class SpeechController {
    final model = SpeechModel();
    final service = SpeechToTextService();

    void startTranscribing() async{
      model.setIsTranscribing(true);
      try {
        String transcript = await service.transcribe();
        model.setTranscript(transcript);
      } catch (e) {
        model.setError(e.toString());
      } finally {
        model.setIsTranscribing(false);
      }
    }

    void stopTranscribing() {
      service.stopTranscribing();
      model.setIsTranscribing(false);
    }
}