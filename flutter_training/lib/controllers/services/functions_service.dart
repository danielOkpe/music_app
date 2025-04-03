import 'dart:convert';

import 'package:flutter_training/controllers/services/dto_service.dart';
import 'package:flutter_training/models/DTO/playlistDTO.dart';
import 'package:flutter_training/models/audio.dart';
import 'package:flutter_training/models/playlist.dart';
import 'package:http/http.dart' as http;


class FunctionsService {


  static Future<dynamic> getAllAudios()async{
    try{
      var response = await http.get(Uri.parse("https://getallaudios-h7n6zdburq-uc.a.run.app"));

      if(response.statusCode == 200){
        dynamic audios = jsonDecode(response.body);
        return audios;
      }
    }catch(e){
      throw Exception("No data");
    }
  }

  static Future<dynamic> getAudio({required String id}) async{
    try{
      var response = await http.get(Uri.parse("https://getaudio-h7n6zdburq-uc.a.run.app?id=$id"));

      if(response.statusCode == 200){
        dynamic audio = jsonDecode(response.body);
        return audio;
      }
    }catch(e){
      throw Exception("No data");
    }
  }

  static Future<dynamic> getAllInitialPlaylist()async{
    try{
      var response = await http.get(Uri.parse("https://getallplaylists-h7n6zdburq-uc.a.run.app"));

      if(response.statusCode == 200){
        dynamic audios = jsonDecode(response.body);
        return audios;
      }else{
        throw Exception("Error");
      }
    }catch(e){
      throw Exception("No data");
    }
}

  static Future<dynamic> getAllOtherPlaylist()async{
    try{
      var response = await http.get(Uri.parse("https://getallotherplaylists-h7n6zdburq-uc.a.run.app"));

      if(response.statusCode == 200){
        dynamic audios = jsonDecode(response.body);
        return audios;
      }
    }catch(e){
      throw Exception("No data");
    }
  }

  static Future<dynamic> getPlaylist({required String id}) async{
    try{
      var response = await http.get(Uri.parse("https://getplaylist-h7n6zdburq-uc.a.run.app?id=$id"));

      if(response.statusCode == 200){
        dynamic audio = jsonDecode(response.body);
        return audio;
      }
    }catch(e){
      throw Exception("No data");
    }
  }
  
  static Future<dynamic> createPlaylist({required PlaylistDTO playlist}) async{
    print("test : ${playlist.toJson()}");
    try{
      var response = await http.post(
          Uri.parse("https://createplaylist-h7n6zdburq-uc.a.run.app"),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode(playlist.toJson())
      );

      if(response.statusCode == 201){
        return jsonDecode(response.body);
      }
    }catch(e){
      throw Exception("No data");
    }
  }

  static Future<dynamic> addAudioToPlaylist(Playlist playlist, Audio audio)async{
    playlist.add(audio);
    PlaylistDTO playlistDTO = DTOService.convertPlaylistToDTO(playlist);

    try{
      var response = await http.put(
        Uri.parse("https://updateplaylist-h7n6zdburq-uc.a.run.app?id=${playlistDTO.id}"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(playlistDTO.toJson())
      );
      
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }

    }catch(e){
      throw Exception("Error when updating the playlist");
    }
  }

  static Future<dynamic> removeAudioToPlaylist(Playlist playlist, Audio audio)async{
    playlist.remove(audio);
    PlaylistDTO playlistDTO = DTOService.convertPlaylistToDTO(playlist);

    try{
      var response = await http.put(
          Uri.parse("https://updateplaylist-h7n6zdburq-uc.a.run.app?id=${playlistDTO.id}"),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode(playlistDTO.toJson())
      );

      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }

    }catch(e){
      throw Exception("Error when updating the playlist");
    }
  }
  
  static Future<String?> deletePlaylist({required String id})async{
    try{
      var response = await http.delete(
          Uri.parse("https://deleteplaylist-h7n6zdburq-uc.a.run.app?id=$id"),
          headers: {
            "Content-Type": "application/json",
          }
      );

      if (response.statusCode == 200){
        return "Playlist successfully deleted";
      }
      
    }catch(e){
      throw Exception("Error when deleting the playlist");
    }
    return null;
  }

}