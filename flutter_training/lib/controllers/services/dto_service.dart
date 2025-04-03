import 'package:flutter_training/models/DTO/audioDTO.dart';
import 'package:flutter_training/models/DTO/playlistDTO.dart';
import 'package:flutter_training/models/audio.dart';
import 'package:flutter_training/models/constants/constants.dart';
import 'package:flutter_training/models/playlist.dart';

import 'firebase_storage_service.dart';

class DTOService{

  static AudioDTO convertAudioToDTO(Audio audio){
    AudioDTO audioDTO = AudioDTO(
        title: audio.title,
        artist: audio.artist,
        file: audio.file,
        img: audio.img,
        duration: audio.duration
    );

    return audioDTO;
  }

  static Future<Audio> convertDTOToAudio(AudioDTO audioDTO) async {
    String imgUrl = await FirebaseStorageService.getUrl(audioDTO.img);
    return Audio(
      title: audioDTO.title,
      artist: audioDTO.artist,
      file: audioDTO.file,
      img: imgUrl,
      duration: audioDTO.duration,
      audioPlayer: Constants.audioPlayer,
    );
  }

  static Future<Audio> convertDTOToAudioWithoutImg(AudioDTO audioDTO) async {
    return Audio(
      title: audioDTO.title,
      artist: audioDTO.artist,
      file: audioDTO.file,
      img: audioDTO.img,
      duration: audioDTO.duration,
      audioPlayer: Constants.audioPlayer,
    );
  }

  static Future<List<Audio>> convertDTOsToAudiosWithoutImg(List<AudioDTO> audioDTOList) async {
    return await Future.wait(audioDTOList.map(convertDTOToAudioWithoutImg));
  }

  static PlaylistDTO convertPlaylistToDTO(Playlist playlist){
    PlaylistDTO playlistDTO = PlaylistDTO(
        playlist: convertAudiosToDTOs(playlist.playlist),
        name: playlist.name
    );

    return playlistDTO;
  }

  static Future<Playlist> convertDTOToPlaylist(PlaylistDTO playlistDTO) async {
    List<Audio> audios = (await convertDTOsToAudios(playlistDTO.playlist));
    return Playlist(
      playlist: audios,
      name: playlistDTO.name,
    );
  }

  static List<AudioDTO> convertAudiosToDTOs(List<Audio> audioList){
    return audioList.map((audio) => convertAudioToDTO(audio)).toList();
  }

  static Future<List<Audio>> convertDTOsToAudios(List<AudioDTO> audioDTOList) async {
    return await Future.wait(audioDTOList.map(convertDTOToAudio));
  }

  static Future<List<Playlist>> convertDTOsToPlaylists(List<PlaylistDTO> playlistsDTO) async {
    return await Future.wait(playlistsDTO.map(convertDTOToPlaylist));
  }

  static List<PlaylistDTO> convertPlaylistsToDTOs(List<Playlist> playlists){
    return playlists.map((playlist) => convertPlaylistToDTO(playlist)).toList();
  }


}