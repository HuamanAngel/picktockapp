import 'package:flutter_tts/flutter_tts.dart';

class ReproduceSound {
  static void speak(String text) {
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setLanguage("es-ES");
    flutterTts.setPitch(1);
    flutterTts.setSpeechRate(0.4);
    flutterTts.speak(text);
  }
}