import 'package:flutter/material.dart';
import 'package:flutter_training/models/constants/constants.dart';

import 'cells/audio_cell.dart';

class PodcastsWidget extends StatelessWidget {
  const PodcastsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: Constants.PODCASTLIST.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index) => AudioCell(playlist: Constants.PODCASTLIST, index: index,)
      ),
    );
  }
}
