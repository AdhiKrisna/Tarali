import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/services/speech_controllers.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final SpeechController controller = Get.put(SpeechController());
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
            Obx(() => controller.model.value.isTranscribing
                ? const CircularProgressIndicator()
                : Text(controller.model.value.transcription)),
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
    await controller.transcribeFromRecording();
    setState(() {
      _isRecording = false;
    });
  }

  void _stopRecording() {
    setState(() {
      _isRecording = false;
    });
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

  void _transcribeFromFile() async {
    if (_selectedFilePath != null) {
      await controller.transcribeFromFile(_selectedFilePath!);
    }
  }
}
