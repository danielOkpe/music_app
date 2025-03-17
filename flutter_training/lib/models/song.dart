import 'package:audioplayers/audioplayers.dart';

class Audio{
  String title;
  String img;
  String file;
  AudioPlayer audioPlayer;

  Audio({required this.title, required this.file, required this.img, required this.audioPlayer});

  void playMusic(){
  audioPlayer.play(AssetSource(file));
  }

  void pauseMusic(){
      audioPlayer.pause();
  }

  get audioPlayerState => audioPlayer.state;
}