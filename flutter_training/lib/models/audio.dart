import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class Audio{
  String title;
  String img;
  String file;
  AudioPlayer audioPlayer;

  Audio({required this.title, required this.file, required this.img, required this.audioPlayer}){
    if (kDebugMode) {
      print("audio $title");
    }
  }

  void playMusic() async{
  await audioPlayer.play(AssetSource(file));
  }

  void pauseMusic() async{
    await audioPlayer.pause();
  }

  void stopMusic() async{
   await audioPlayer.stop();
  }

  get audioPlayerState => audioPlayer.state;
}