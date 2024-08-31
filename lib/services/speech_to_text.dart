import 'dart:convert';
import 'dart:io';
import 'package:googleapis/speech/v2.dart' as speech_v2;
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter_sound/flutter_sound.dart';

class SpeechToTextService {
  final String projectId;
  final String credentialsJsonPath;

  SpeechToTextService({
    required this.projectId,
    required this.credentialsJsonPath,
  });

  Future<String> transcribeAudioFile(String audioFilePath) async {
    // Load credentials from file
    final credentials = ServiceAccountCredentials.fromJson(
        json.decode(await File(credentialsJsonPath).readAsString()));

    // Authenticate client
    final client = await clientViaServiceAccount(
        credentials, [speech_v2.SpeechApi.cloudPlatformScope]);

    final speechApi = speech_v2.SpeechApi(client);

    // Read audio file
    final audioBytes = await File(audioFilePath).readAsBytes();

    final config = speech_v2.RecognitionConfig(
      autoDecodingConfig: speech_v2.AutoDetectDecodingConfig(),
      languageCodes: ['id-ID'],
      model: 'long',
    );

    final request = speech_v2.RecognizeRequest(
      // uri: 'projects/$projectId/locations/global/recognizers/_',
      config: config,
      content: base64Encode(audioBytes),
    );
    try {
      // Make the API call
      final response = await speechApi.projects.locations.recognizers.recognize(
        request,
        'projects/$projectId/locations/global/recognizers/_',
      );

      // Process the response
      if (response.results != null && response.results!.isNotEmpty) {
        String transcript = response.results!
            .map((result) => result.alternatives!.first.transcript)
            .join(' '); // Join all transcripts if needed
        return transcript;
      } else {
        throw Exception('No transcription results returned.');
      }
    } catch (e) {
      throw Exception('Error during transcription: $e');
    } finally {
      client.close(); // Ensure client is closed
    }
  }


  Future<String> transcribeRecording() async {
    final recorder = FlutterSoundRecorder();

    // Load credentials from file
    final credentials = ServiceAccountCredentials.fromJson(
      json.decode(await File(credentialsJsonPath).readAsString()),
    );

    // Authenticate client
    final client = await clientViaServiceAccount(
      credentials,
      [speech_v2.SpeechApi.cloudPlatformScope],
    );

    final speechApi = speech_v2.SpeechApi(client);

    // Start recording audio
    await recorder.openRecorder();
    await recorder.startRecorder(
      toFile: 'temp_audio.wav', // File untuk menyimpan audio
      codec: Codec.pcm16WAV,
    );

    //print("Recording... Press enter to stop.");
    await Future.delayed(const Duration(seconds: 10)); // Rekam selama 10 detik (atau sesuai kebutuhan)
    await recorder.stopRecorder();

    // Read recorded audio
    final audioBytes = await File('temp_audio.wav').readAsBytes();

    final config = speech_v2.RecognitionConfig(
      autoDecodingConfig: speech_v2.AutoDetectDecodingConfig(),
      languageCodes: ['id-ID'], // Update to your desired language
      model: 'long',
    );

    final request = speech_v2.RecognizeRequest(
      config: config,
      content: base64Encode(audioBytes),
    );

    try {
      // Make the API call
      final response = await speechApi.projects.locations.recognizers.recognize(
        request,
        'projects/$projectId/locations/global/recognizers/_',
      );

      // Process the response
      if (response.results != null && response.results!.isNotEmpty) {
        String transcript = response.results!
            .map((result) => result.alternatives!.first.transcript)
            .join(' '); // Join all transcripts if needed
        return transcript;
      } else {
        throw Exception('No transcription results returned.');
      }
    } catch (e) {
      throw Exception('Error during transcription: $e');
    } finally {
      client.close(); // Ensure client is closed
      await recorder.closeRecorder(); // Close audio session
    }
  }
}
