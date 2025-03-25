import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class Audio{
  String title;
  String artist;
  String img;
  String file;
  AudioPlayer audioPlayer;
  int duration;

  Audio({required this.title, required this.artist, required this.file, required this.img, required this.audioPlayer, required this.duration}){
    if (kDebugMode) {
      print("audio $artist");
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