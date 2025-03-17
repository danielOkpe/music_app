import 'package:flutter/material.dart';
import 'package:flutter_training/models/constants/constants.dart';
import 'package:flutter_training/models/song.dart';
import 'package:flutter_training/views/pages/audio_screen.dart';
import 'package:flutter_training/views/widgets/cells/audio_cell.dart';

class AllWidget extends StatelessWidget {
  AllWidget({super.key});
  List<Audio> songs = Constants().SONGLIST;
  List<Audio> podcasts = Constants().PODCASTLIST;
  List<Audio> audioBooks = Constants().AUDIOBOOK;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
              itemCount: songs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => AudioCell(audio: songs[index])
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 200,
          child:ListView.builder(
              itemCount: podcasts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => AudioCell(audio: podcasts[index])
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
              itemCount: audioBooks.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => AudioCell(audio: audioBooks[index])
          ),
        )
      ],
    );
  }
}
