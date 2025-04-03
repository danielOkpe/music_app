import 'package:flutter/material.dart';
import 'package:flutter_training/models/playlist.dart';

import '../widgets/cells/audio_cell.dart';


class PlaylistScreen extends StatefulWidget {
  PlaylistScreen({super.key, required this.playlist});
  Playlist playlist;
  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState(playlist: playlist);
}

class _PlaylistScreenState extends State<PlaylistScreen> {

  _PlaylistScreenState({required this.playlist});
  Playlist playlist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Center(
        child:SizedBox(
          child: ListView.builder(
            itemCount: playlist.playlist.length,
            itemBuilder: (context, index) => AudioCell(
              playlist: playlist.playlist,
              index: index,
            ),
          ),
        ),
      ) ,
      );
  }
}
