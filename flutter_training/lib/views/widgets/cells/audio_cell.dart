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
    return Row(
      children: [
        SizedBox(width: 8,),
        SizedBox(
          height: 200,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                Image(
                    image:NetworkImage(playlist[index].img)
                ),
                SizedBox(width: 16,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(playlist[index].title),
                          SizedBox(width: 32.0,),
                          Text(playlist[index].artist),
                          SizedBox(width: 8,)
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 4,),
                          Text(readableDuration(playlist[index].duration)),
                          SizedBox(width: 52.0,),
                          IconButton(
                              onPressed: (){
                                playlist[index].playMusic();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AudioScreen(playlist: playlist, index: index,)));
                              },
                              icon: Icon(Icons.play_arrow)
                          ),
                        ],
                      ),
                    ],
                  ) ,
                ),
              ],
            ),
          ) ,
        ),
        SizedBox(width: 2,),
      ],
    );
  }
  String readableDuration(int duration){
   int minutes = (duration / 60).toInt();
   int seconds = (duration % 60).toInt();
   
   return "$minutes : $seconds ";
  }
}
