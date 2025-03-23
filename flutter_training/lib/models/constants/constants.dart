import 'package:audioplayers/audioplayers.dart';
import '../audio.dart';

class Constants{

  static final AudioPlayer audioPlayer = AudioPlayer();

  static final List<Audio> AUDIOS = [
    Audio(title: "Song 1", artist: "artist 1", file: "audio/allegro.mp3",
        img: "assets/images/cover_1.jpg", audioPlayer: audioPlayer, duration: 494 ),
    Audio(title: "Song 2", artist: "artist 2", file: "audio/BOUCAN.mp3",
        img: "assets/images/cover_2.jpg", audioPlayer: audioPlayer, duration: 252),
    Audio(title: "Song 3", artist: "artist 3", file: "audio/allegro.mp3",
        img: "assets/images/cover_1.jpg", audioPlayer: audioPlayer, duration: 494),
    Audio(title: "Song 4", artist: "artist 4", file: "audio/BOUCAN.mp3",
        img: "assets/images/cover_2.jpg", audioPlayer: audioPlayer, duration: 252),
    Audio(title: "Song 5", artist: "artist 5", file: "audio/allegro.mp3",
        img: "assets/images/cover_1.jpg", audioPlayer: audioPlayer, duration: 494),
    Audio(title: "Song 6", artist: "artist 6", file: "audio/BOUCAN.mp3",
        img: "assets/images/cover_2.jpg", audioPlayer: audioPlayer, duration: 252),
  ];

  static final List<Audio> SONGLIST =  [
    AUDIOS[0],
    AUDIOS[1]
  ];

  static final List<Audio> PODCASTLIST =  [
    AUDIOS[2],
    AUDIOS[3]
  ];

  static final List<Audio> AUDIOBOOK =  [
    AUDIOS[4],
    AUDIOS[5]
  ];

}