import 'package:flutter/material.dart';
import 'package:flutter_training/models/constants/constants.dart';
import '../../models/audio.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Audio> audios = Constants.AUDIOS;

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
              return List<ListTile>.generate(audios.length, (int index) {
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

