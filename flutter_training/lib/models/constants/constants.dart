import 'package:audioplayers/audioplayers.dart';

import '../audio.dart';

class Constants{

  static final AudioPlayer audioPlayer = AudioPlayer();

  static final List<Audio> AUDIOS = [
    Audio(title: "Song 1", file: "audio/allegro.mp3",
        img: "assets/images/cover_1.jpg", audioPlayer: audioPlayer ),
    Audio(title: "Song 2", file: "audio/BOUCAN.mp3",
        img: "assets/images/cover_2.jpg", audioPlayer: audioPlayer),
    Audio(title: "Song 3", file: "audio/allegro.mp3",
        img: "assets/images/cover_1.jpg", audioPlayer: audioPlayer),
    Audio(title: "Song 4", file: "audio/BOUCAN.mp3",
        img: "assets/images/cover_2.jpg", audioPlayer: audioPlayer),
    Audio(title: "Song 5", file: "audio/allegro.mp3",
        img: "assets/images/cover_1.jpg", audioPlayer: audioPlayer),
    Audio(title: "Song 6", file: "audio/BOUCAN.mp3",
        img: "assets/images/cover_2.jpg", audioPlayer: audioPlayer),
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