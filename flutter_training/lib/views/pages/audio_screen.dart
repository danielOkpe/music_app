import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/models/song.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key, required this.audio});
  final Audio audio;

  @override
  State<AudioScreen> createState() => _AudioScreenState(audio: audio);
}

class _AudioScreenState extends State<AudioScreen> {
  _AudioScreenState({required this.audio});
  final Audio audio;
  IconData playPauseIcon = Icons.pause;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
              image: AssetImage(audio.img)
          ),
          Text(audio.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.fast_rewind)),
              IconButton(onPressed: (){
                if(audio.audioPlayerState == PlayerState.playing){
                  audio.pauseMusic();
                  setState(() {
                    playPauseIcon = Icons.play_circle;
                  });
                }else if (audio.audioPlayerState == PlayerState.paused){
                  audio.playMusic();
                  setState(() {
                    playPauseIcon = Icons.pause;
                  });
                }

              }, icon: Icon(playPauseIcon)),
              IconButton(onPressed: (){}, icon: Icon(Icons.fast_forward)),
            ],

          )
        ],
      )
    );
  }
}
