import 'package:flutter/material.dart';
import 'package:flutter_training/models/audio.dart';
import 'package:flutter_training/models/constants/constants.dart';
import 'package:flutter_training/models/playlist.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late List<Playlist> playlists;
  List<Audio> allAudios = Constants().AUDIOS;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playlists = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child:ListView.builder(
              itemCount: playlists.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => Card(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("playlist $index"),
                    TextButton(
                        onPressed: (){},
                        child: Text("+")
                    )
                  ],
                ) ,
              )
          ) ,
        ),
        Center(
          child:TextButton(
              onPressed: (){},
              child: Text("+ Créer une nouvelle playlist")
          ) ,
        )
      ],
    );
  }
}

