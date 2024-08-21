class SpeechModel {
  String _transcription = '';
  bool _isTranscribing = false;
  String _error = '';

  String get transcription => _transcription;
  bool get isTranscribing => _isTranscribing;
  String get error => _error;

   void setTranscript(String transcript) {
    _transcription = transcript;
  }
  void setIsTranscribing(bool isTranscribing) {
    _isTranscribing = isTranscribing;
  }
  void setError(String error) {
    _error = error;
  }


}
