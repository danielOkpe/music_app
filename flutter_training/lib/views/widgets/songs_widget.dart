import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/models/audio.dart';
import 'package:flutter_training/views/widgets/cells/audio_cell.dart';
import 'package:flutter_training/models/constants/constants.dart';

class SongsWidget extends StatelessWidget {
   const SongsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: Constants.SONGLIST.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index) => AudioCell(playlist: Constants.SONGLIST, index: index)
      ),
    );
  }
}
