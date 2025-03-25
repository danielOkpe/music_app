import 'package:flutter/material.dart';

import '../../models/constants/constants.dart';
import 'cells/audio_cell.dart';

class AudioBookWidget extends StatefulWidget {
  const AudioBookWidget({super.key});

  @override
  State<AudioBookWidget> createState() => _AudioBookWidgetState();
}

class _AudioBookWidgetState extends State<AudioBookWidget> {

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
    return  AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: _opacity,
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: Constants.AUDIOBOOK.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => AudioCell(
            playlist: Constants.AUDIOBOOK,
            index: index,
          ),
        ),
      ),
    );
  }
}

