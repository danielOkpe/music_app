import 'package:flutter/material.dart';
import 'package:flutter_training/models/constants/constants.dart';
import 'package:flutter_training/models/audio.dart';

import 'cells/audio_cell.dart';

class PodcastsWidget extends StatelessWidget {
  PodcastsWidget({super.key});
  final List<Audio> podcasts = Constants().PODCASTLIST;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: podcasts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index) => AudioCell(playlist: podcasts, index: index,)
      ),
    );
  }
}
