import 'package:flutter/material.dart';
import 'package:flutter_training/views/widgets/cells/audio_cell.dart';
import 'package:flutter_training/models/constants/constants.dart';

class SongsWidget extends StatefulWidget {
  const SongsWidget({super.key});

  @override
  State<SongsWidget> createState() => _SongsWidgetState();
}

class _SongsWidgetState extends State<SongsWidget> {
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
          itemCount: Constants.SONGLIST.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => AudioCell(
            playlist: Constants.SONGLIST,
            index: index,
          ),
        ),
      ),
    );
  }
}

