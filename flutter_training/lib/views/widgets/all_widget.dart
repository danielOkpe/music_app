import 'package:flutter/material.dart';
import 'package:flutter_training/models/constants/constants.dart';
import 'package:flutter_training/models/audio.dart';
import 'package:flutter_training/views/pages/audio_screen.dart';
import 'package:flutter_training/views/widgets/cells/audio_cell.dart';

class AllWidget extends StatelessWidget {
  const AllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child:_buildListView(Constants.SONGLIST),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 200,
          child:_buildListView(Constants.PODCASTLIST),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 200,
          child: _buildListView(Constants.AUDIOBOOK)
        )
      ],
    );
  }

 Widget _buildListView(List<Audio> audios){
    return ListView.builder(
        itemCount: audios.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => AudioCell(playlist: audios, index: index,)
    );
  }
}
