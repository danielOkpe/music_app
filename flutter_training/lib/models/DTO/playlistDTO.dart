import 'package:flutter_training/models/DTO/audioDTO.dart';

class PlaylistDTO{
  String? id;
  List<AudioDTO> playlist;
  String name;
  bool? isInitial;

  PlaylistDTO({this.id,required this.playlist, required this.name, this.isInitial = false}){
    print("playlistDTO $name");
  }

  List<Map<String,dynamic>> _convertPlaylistToJSON(){
    return playlist.map((audio) => audio.toJSON()).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "isInitial": isInitial,
      "playlist" : _convertPlaylistToJSON()
    };
  }

  static PlaylistDTO fromJson(Map<String, dynamic> json) {
    return PlaylistDTO(
      name: json['name'] ?? '',
      isInitial: json['isInitial'] ?? false,
      playlist: (json['playlist'] as List<dynamic>? ?? [])
          .map((e) => AudioDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}