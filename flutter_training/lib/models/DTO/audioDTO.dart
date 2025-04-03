import 'package:flutter/foundation.dart';

class AudioDTO {
  String? id;
  String title;
  String artist;
  String img;
  String file;
  int duration;


  AudioDTO({required this.title, required this.artist, required this.file, required this.img,required this.duration, this.id}){
    if (kDebugMode) {
      print("audio $id");
    }
  }

  Map<String, dynamic> toJSON() {
    return{
      "title": title,
      "artist": artist,
      "img": img,
      "audio": file,
      "duration": duration,
    };
  }

  static AudioDTO fromJson(Map<String, dynamic> e) {
    return AudioDTO(
        id: e["id"],
        title: e["title"],
        artist: e["artist"],
        file: e["audio"],
        img: e["img"],
        duration: e["duration"]
    );
  }

}