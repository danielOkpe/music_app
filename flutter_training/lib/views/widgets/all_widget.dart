import 'package:flutter/material.dart';
import 'package:flutter_training/models/constants/constants.dart';
import 'package:flutter_training/models/audio.dart';
import 'package:flutter_training/models/playlist.dart';
import 'package:flutter_training/views/widgets/cells/audio_cell.dart';

class AllWidget extends StatefulWidget {
  AllWidget({super.key,required this.playlists });

  List<Playlist> playlists;
  @override
  State<AllWidget> createState() => _AllWidgetState(playlists: playlists);
}

class _AllWidgetState extends State<AllWidget> {

  _AllWidgetState({required this.playlists});

  List<Playlist> playlists;
  List<double> opacities = [];
  List<double> translations = [];

  @override
  void initState() {
    super.initState();
    _startAnimations();
  }

  int getTotalItems(){
    int cpt = 0;
    for(Playlist playlist in playlists){
      cpt += playlist.playlist.length;
    }
    return cpt;
  }

  void _startAnimations() {
    int totalItems = getTotalItems();

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
    return Column(
      children: List.generate(playlists.length, (playlistIndex) {
        int startIndex = playlists.sublist(0, playlistIndex).fold(0, (sum, playlist) => sum + playlist.playlist.length);
        return Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: _buildAnimatedListView(playlists[playlistIndex].playlist, startIndex),
            ),
          ],
        );
      }),
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
