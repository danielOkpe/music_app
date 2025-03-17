import 'package:flutter/material.dart';

import '../../models/constants/constants.dart';
import '../../models/song.dart';
import 'cells/audio_cell.dart';

class AudioBookWidget extends StatelessWidget {
  AudioBookWidget({super.key});
  final List<Audio> audiobooks = Constants().AUDIOBOOK;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: audiobooks.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index) => AudioCell(audio: audiobooks[index])
      ),
    );
  }
}
