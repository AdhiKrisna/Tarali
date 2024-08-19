import 'package:flutter/material.dart';
import 'package:tarali/constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.title});
  final String title;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var text = 'tes123';

  Future<String> convertSpeechToText(String filePath) async {
    const apiKey = apiSecretKey;
    var url = Uri.https("api.openai.com", "v1/audio/transcriptions");
    var request = http.MultipartRequest('POST', url);
    request.headers.addAll({
      'Authorization': 'Bearer $apiKey',
    });
    request.fields["model"] = "whisper-1";
    request.fields["language"] = "id";
    request.files.add(await http.MultipartFile.fromPath('file', filePath));
    try {
      var response = await request.send();
      var responseString = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        final responseData = json.decode(responseString.body);
        print(responseData);
        return responseData['text'] ?? 'No text found';
      } else {
        print('Error: ${responseString.body}');
        return 'Error during speech-to-text conversion';
      }
    } catch (e) {
      print('Exception: $e');
      return 'Failed to convert speech to text';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Text: $text',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Convert Speech to Text'),
              onPressed: () async {
                final file = await FilePicker.platform.pickFiles();
                text = 'Converting speech to text...';
                if (file != null) {
                  final result = await                  
                  convertSpeechToText(file.files.single.path!);
                  setState(() {
                    text = result;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
