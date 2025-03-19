import 'package:flutter/material.dart';
import 'package:flutter_training/models/audio.dart';
import 'package:flutter_training/views/pages/audio_screen.dart';


class AudioCell extends StatefulWidget {
  const AudioCell({super.key, required this.playlist, required this.index});
  
  final List<Audio> playlist;
  final int index;
  
  @override
  State<AudioCell> createState() => _AudioCellState(playlist: playlist, index: index);
}

class _AudioCellState extends State<AudioCell> {
  _AudioCellState({required this.playlist, required this.index});
  final List<Audio> playlist;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child:  Card(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
            image:AssetImage(playlist[index].img)
        ),
        Text(playlist[index].title),
        IconButton(
            onPressed: (){
              playlist[index].playMusic();
              Navigator.push(context, MaterialPageRoute(builder: (context) => AudioScreen(playlist: playlist, index: index,)));
              },
            icon: Icon(Icons.play_arrow)
        ),
      ],
    ),
    ),
    );
  }
}
