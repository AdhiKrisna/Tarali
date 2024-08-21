import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tarali/controllers/speech_controllers.dart';
import 'package:tarali/services/speech_to_text.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  final SpeechController controller = Get.put(SpeechController());
  final SpeechToTextService service = SpeechToTextService();
  bool _isRecording = false;
  String? _selectedFilePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech to Text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.model.transcription),
            ElevatedButton(
              onPressed: _isRecording ? null : _startRecording,
              child: const Text('Mulai Rekam'),
            ),
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : null,
              child: const Text('Hentikan Rekam'),
            ),
            ElevatedButton(
              onPressed: _pickFile,
              child: const Text('Pilih File'),
            ),
            if (_selectedFilePath != null)
              Text('File yang dipilih: $_selectedFilePath'),
            //ini blm kepake
            ElevatedButton(
              onPressed: _selectedFilePath != null ? _transcribeFromFile : null,
              child: const Text('Transkripsi File'),
            ),
          ],
        ),
      ),
    );
  }

  void _startRecording() async {
    setState(() {
      _isRecording = true;
    });
    controller.startTranscribing();
  }

  void _stopRecording() {
    setState(() {
      _isRecording = false;
    });
    controller.stopTranscribing();
    transcribeFromStream();
  }

  void _pickFile() async {
    String? filePath = await FilePicker.platform.pickFiles().then((value) {
      if (value != null) {
        return value.files.single.path;
      } else {
        return null;
      }
    });
    setState(() {
      _selectedFilePath = filePath;
    });
  }

  void transcribeFromStream() async {
    await service.transcribe();
  }

  void _transcribeFromFile() async {
    //ini blm kepake
    await service.transcribe();
  }
}
