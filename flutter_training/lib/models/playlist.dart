import 'package:flutter_training/models/audio.dart';

class Playlist{
  List<Audio> playlist;

  Playlist({required this.playlist});

  add(Audio audio){
    playlist.add(audio);
  }

  remove(Audio audio){
    playlist.remove(audio);
  }

  get length => playlist.length;

}