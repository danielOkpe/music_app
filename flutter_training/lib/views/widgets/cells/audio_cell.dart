import 'package:flutter/material.dart';
import 'package:flutter_training/models/song.dart';
import 'package:flutter_training/views/pages/audio_screen.dart';


class AudioCell extends StatefulWidget {
  const AudioCell({super.key, required this.audio});
  
  final Audio audio;
  
  @override
  State<AudioCell> createState() => _AudioCellState(audio: audio);
}

class _AudioCellState extends State<AudioCell> {
  _AudioCellState({required this.audio});
  final Audio audio;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child:  Card(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
            image:AssetImage(audio.img)
        ),
        Text(audio.title),
        IconButton(
            onPressed: (){
              audio.playMusic();
              Navigator.push(context, MaterialPageRoute(builder: (context) => AudioScreen(audio: audio)));
              },
            icon: Icon(Icons.play_arrow)
        ),
      ],
    ),
    ),
    );
  }
}
