import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../models/audio.dart';
import 'audio_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Audio> audios = [
    Audio(title: "Song 1", file: "audio/allegro.mp3",
        img: "assets/images/cover_1.jpg", audioPlayer: AudioPlayer()),
    Audio(title: "Song 2", file: "audio/BOUCAN.mp3",
        img: "assets/images/cover_2.jpg", audioPlayer: AudioPlayer()),
    Audio(title: "Song 3", file: "audio/allegro.mp3",
        img: "assets/images/cover_1.jpg", audioPlayer: AudioPlayer()),
    Audio(title: "Song 4", file: "audio/BOUCAN.mp3",
        img: "assets/images/cover_2.jpg", audioPlayer: AudioPlayer()),
    Audio(title: "Song 5", file: "audio/allegro.mp3",
        img: "assets/images/cover_1.jpg", audioPlayer: AudioPlayer()),
    Audio(title: "Song 6", file: "audio/BOUCAN.mp3",
        img: "assets/images/cover_2.jpg", audioPlayer: AudioPlayer()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchAnchor(
            builder: (BuildContext context, SearchController controller ){
              return SearchBar(
                controller: controller,
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
              );
            },
            suggestionsBuilder: (BuildContext context, SearchController controller){
              return List<ListTile>.generate(6, (int index) {
                final String item = 'Song ${index + 1}';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      audios[index].playMusic();
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => AudioScreen(audio: audios[index])));
                    });
                  },
                );
              });
            }
        ),
        const Expanded(
            child:  Center(
              child: Text("Recherchez"),
            )
        )
      ],
    );
  }
}

