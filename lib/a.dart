String xorCipher(String text, int key) {
  return String.fromCharCodes(text.codeUnits.map((unit) => unit ^ key));
}

String streamCipher(String text, List<int> keyStream, bool isEncrypt) {
  return String.fromCharCodes(text.codeUnits.asMap().entries.map((entry) {
    int i = entry.key;
    return entry.value ^ keyStream[i % keyStream.length];
  }));
}

void main(List<String> args) {
  String text = 'Hello World';
  List<int> keyStream = [1, 2, 3, 4, 5];
  String encrypted = xorCipher(text, 5);
  String decrypted = xorCipher(encrypted, 5);
  print('XOR Cipher');
  print('Text: $text');
  print('Encrypted: $encrypted');
  print('Decrypted: $decrypted');

  encrypted = streamCipher(text, keyStream, true);
  decrypted = streamCipher(encrypted, keyStream, false);

  print('\n\nStream Cipher');
  print('Text: $text');
  print('Encrypted: $encrypted');
  print('Decrypted: $decrypted');
  
}