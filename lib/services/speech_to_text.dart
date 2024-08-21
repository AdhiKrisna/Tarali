import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tarali/constants/api_constant.dart';

class SpeechToTextService {
  final apiKey = apiSecretKey;
  final String baseUrl = 'https://speech.googleapis.com/v1/speech:recognize';
  Future<String> transcribe() async {
    final body = jsonEncode({
      "config": {
        "encoding": "LINEAR16",
        "sampleRateHertz": 44100,
        "languageCode": "id-ID", 
        "model": "command_and_search", 
        "enableAutomaticPunctuation": true, 
      },
      // "audio": {
      //   "content": base64,
      // }
    });
    
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final transcript = data['results'][0]['alternatives'][0]['transcript'];
        return transcript;
      } else {
        throw Exception('Error during transcription: ${response.statusCode}');
      }

    } catch (e) {
      throw Exception('Error during transcription: $e');
    }
  }

  void stopTranscribing() {
    // Tidak ada yang perlu dilakukan di sini karena transkripsi dilakukan secara asinkron
  }
}
