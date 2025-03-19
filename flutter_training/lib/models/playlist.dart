import 'package:flutter_training/models/audio.dart';

class Playlist{
  List<Audio> playlist;
  String name;

  Playlist({required this.playlist, required this.name});

  add(Audio audio){
    playlist.add(audio);
  }

  remove(Audio audio){
    playlist.remove(audio);
  }

  get length => playlist.length;

}