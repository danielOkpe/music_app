import 'package:flutter/material.dart';
import 'package:flutter_training/models/constants/constants.dart';
import 'package:flutter_training/models/audio.dart';
import 'package:flutter_training/views/widgets/cells/audio_cell.dart';

class AllWidget extends StatefulWidget {
  const AllWidget({super.key});

  @override
  State<AllWidget> createState() => _AllWidgetState();
}

class _AllWidgetState extends State<AllWidget> {

  List<double> opacities = [];
  List<double> translations = [];

  @override
  void initState() {
    super.initState();
    _startAnimations();
  }

  void _startAnimations() {
    int totalItems = Constants.SONGLIST.length + Constants.PODCASTLIST.length + Constants.AUDIOBOOK.length;

    opacities = List.generate(totalItems, (_) => 0.0);
    translations = List.generate(totalItems, (_) => -20.0);

    for (int i = 0; i < totalItems; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) {
          setState(() {
            opacities[i] = 1.0;
            translations[i] = 0.0;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200,
          child:_buildAnimatedListView(Constants.SONGLIST, 0),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200,
          child:_buildAnimatedListView(Constants.PODCASTLIST, Constants.SONGLIST.length),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 200,
            child: _buildAnimatedListView(Constants.AUDIOBOOK, Constants.SONGLIST.length + Constants.PODCASTLIST.length )
        )
      ],
    );
  }


  Widget _buildAnimatedListView(List<Audio> audios, int startIndex) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: audios.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          int globalIndex = startIndex + index;

          return AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: opacities[globalIndex],
            child: Transform.translate(
              offset: Offset(0, translations[globalIndex]),
              child: AudioCell(playlist: audios, index: index),
            ),
          );
        },
      ),
    );
  }
}
