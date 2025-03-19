import 'package:flutter/material.dart';

import '../../models/constants/constants.dart';
import '../../models/audio.dart';
import 'cells/audio_cell.dart';

class AudioBookWidget extends StatelessWidget {
  const AudioBookWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: Constants.AUDIOBOOK.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index) => AudioCell(playlist: Constants.AUDIOBOOK, index: index,)
      ),
    );
  }

}
