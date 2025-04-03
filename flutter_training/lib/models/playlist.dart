import 'package:flutter_training/models/audio.dart';

class Playlist{
  String? id;
  List<Audio> playlist;
  String name;
  bool? isInitial;

  Playlist({required this.playlist, required this.name, this.isInitial = false}){
    print("playlist $name");
  }

  add(Audio audio){
    playlist.add(audio);
  }

  remove(Audio audio){
    playlist.remove(audio);
  }

  get length => playlist.length;


}