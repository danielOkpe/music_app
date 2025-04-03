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
  Duration maxDuration = Duration(seconds: 0);
  Duration position = Duration(seconds: 0);
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

onDurationChange(Duration duration){
  setState(() {
    maxDuration = duration;
  });
}

onPositionChange(double newPosition){
  final newDuration = Duration(seconds: newPosition.toInt());
  playlist[_index].audioPlayer.seek(newDuration);
}

onAudioPositionChange(Duration newPosition){
  setState(() {
    position = newPosition;
  });
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _index = index;

    playlist[_index].audioPlayer.onDurationChanged.listen(onDurationChange);
    
    playlist[_index].audioPlayer.onPositionChanged.listen(onAudioPositionChange);

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
              image: NetworkImage(playlist[_index].img)
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
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(readableDuration(position)),
                  Text(readableDuration(maxDuration))
                ],
              ),
          ),
          Slider(
              min: 0,
              max: maxDuration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: onPositionChange,
              thumbColor: Colors.white,
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
          )
        ],
      )
    );
  }

  String readableDuration(Duration duration){
  int minutes = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);
  String minutesStr = (minutes < 10) ? "0$minutes" : minutes.toString();
  String secondsStr = (seconds < 10) ? "0$seconds" : seconds.toString();

  return "$minutesStr : $secondsStr";
  }
}


