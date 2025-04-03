import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

import '../controllers/services/firebase_storage_service.dart';

class Audio{
  String? id;
  String title;
  String artist;
  String img;
  String file;
  AudioPlayer audioPlayer;
  int duration;

  Audio({required this.title, required this.artist, required this.file, required this.img, required this.audioPlayer, required this.duration}){
    if (kDebugMode) {
      print("audio $title");
    }
  }

  void playMusic() async{
    String url = await FirebaseStorageService.getUrl(file);
    await audioPlayer.play(UrlSource(url));
  }

  void pauseMusic() async{
    await audioPlayer.pause();
  }

  void stopMusic() async{
   await audioPlayer.stop();
  }


  get audioPlayerState => audioPlayer.state;

}