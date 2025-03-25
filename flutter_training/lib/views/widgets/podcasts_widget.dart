import 'package:flutter/material.dart';
import 'package:flutter_training/models/constants/constants.dart';

import 'cells/audio_cell.dart';

class PodcastsWidget extends StatefulWidget {
  const PodcastsWidget({super.key});

  @override
  State<PodcastsWidget> createState() => _PodcastsWidgetState();
}

class _PodcastsWidgetState extends State<PodcastsWidget> {
  double _opacity = 0.0;

  _startAnimation(){
    Future.delayed(Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return   AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: _opacity,
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: Constants.PODCASTLIST.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => AudioCell(
            playlist: Constants.PODCASTLIST,
            index: index,
          ),
        ),
      ),
    );
  }
}

