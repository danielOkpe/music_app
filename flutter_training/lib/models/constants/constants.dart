import 'package:audioplayers/audioplayers.dart';

import '../audio.dart';

class Constants{
  final List<Audio> _SONGLIST = [
    Audio(title: "Song 1", file: "audio/allegro.mp3",
        img: "assets/images/cover_1.jpg", audioPlayer: AudioPlayer()),
    Audio(title: "Song 2", file: "audio/BOUCAN.mp3",
        img: "assets/images/cover_2.jpg", audioPlayer: AudioPlayer()),
  ];

  final List<Audio> _PODCASTLIST = [
    Audio(title: "Song 3", file: "audio/allegro.mp3",
        img: "assets/images/cover_1.jpg", audioPlayer: AudioPlayer()),
    Audio(title: "Song 4", file: "audio/BOUCAN.mp3",
        img: "assets/images/cover_2.jpg", audioPlayer: AudioPlayer()),
  ];

  final List<Audio> _AUDIOBOOK = [
    Audio(title: "Song 5", file: "audio/allegro.mp3",
        img: "assets/images/cover_1.jpg", audioPlayer: AudioPlayer()),
    Audio(title: "Song 6", file: "audio/BOUCAN.mp3",
        img: "assets/images/cover_2.jpg", audioPlayer: AudioPlayer()),
  ];


  get SONGLIST => _SONGLIST;
  get PODCASTLIST => _PODCASTLIST;
  get AUDIOBOOK => _AUDIOBOOK;

}