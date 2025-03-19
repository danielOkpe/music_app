import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/models/audio.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key, required this.playlist, required this.index});
  final List<Audio> playlist;
  final int index;
  @override
  State<AudioScreen> createState() => _AudioScreenState(playlist: playlist, index: index);
}

class _AudioScreenState extends State<AudioScreen> {
  _AudioScreenState({required this.playlist, required this.index});
  final List<Audio> playlist;
  final int index;
  late int _index;
  bool isPlaying = true;

nextSong(){
  if(_index < playlist.length - 1){
    playlist[_index].stopMusic();
    setState(() {
      _index = _index + 1;
    });
    playlist[_index].playMusic();
    setState(() {
      isPlaying = true;
    });
  }else{
    playlist[_index].stopMusic();
    setState(() {
      isPlaying = false;
    });
  }
}

previousSong(){
  if(_index > 0){
    playlist[_index].stopMusic();
    setState(() {
      _index = _index - 1;
    });
    playlist[_index].playMusic();
    setState(() {
      isPlaying = true;
    });
  }else{
    playlist[_index].stopMusic();
    setState(() {
      isPlaying = false;
    });
  }
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _index = index;

    playlist[_index].audioPlayer.onPlayerComplete.listen((event) {
      nextSong();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
              image: AssetImage(playlist[_index].img)
          ),
          Text(playlist[_index].title),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){ previousSong(); }, icon: Icon(Icons.fast_rewind)),
              IconButton(onPressed: (){
                if(playlist[_index].audioPlayerState == PlayerState.playing){
                  playlist[_index].pauseMusic();
                  setState(() {
                    isPlaying = false;
                  });
                }else{
                  playlist[_index].playMusic();
                  setState(() {
                    isPlaying = true;
                  });
                }

              }, icon:Icon(isPlaying? Icons.pause : Icons.play_circle)),
              IconButton(onPressed: (){ nextSong(); }, icon: Icon(Icons.fast_forward)),
            ],

          )
        ],
      )
    );
  }
}
