import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/models/audio.dart';
import 'package:flutter_training/views/widgets/cells/audio_cell.dart';
import 'package:flutter_training/models/constants/constants.dart';

class SongsWidget extends StatelessWidget {
   SongsWidget({super.key});

   List<Audio> songs = Constants().SONGLIST;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: songs.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index) => AudioCell(playlist: songs, index: index)
      ),
    );
  }
}
