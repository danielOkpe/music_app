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
  List<Audio> allAudios = Constants.AUDIOS;
  Color buttonBackground = Colors.transparent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playlists = [];
  }

  void _createPlaylist() async {
    TextEditingController nameController = TextEditingController();
    List<Audio> selectedAudios = [];

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Créer une playlist"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Permet d'éviter un trop grand espace
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Nom de la playlist"),
                ),
                SizedBox(height: 10),
                Text("Sélectionner des musiques"),
                SizedBox(
                  height: 200, // Limite la hauteur pour éviter un débordement
                  width: double.maxFinite, // Permet d'utiliser toute la largeur disponible
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 10, // Espacement horizontal entre les boutons
                      runSpacing: 10, // Espacement vertical entre les boutons
                      children: allAudios.map((audio) {
                        return ElevatedButton(
                          onPressed: () {
                            if (selectedAudios.contains(audio)) {
                              selectedAudios.remove(audio);
                              setState(() {
                                buttonBackground = Colors.red;
                              });
                            } else {
                              selectedAudios.add(audio);
                              setState(() {
                                buttonBackground = Colors.green;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonBackground
                          ),
                          child: Text(audio.title, textAlign: TextAlign.center),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Annuler"),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && selectedAudios.isNotEmpty) {
                  setState(() {
                    playlists.add(Playlist(name: nameController.text,playlist: selectedAudios));
                  });
                  Navigator.pop(context);
                }
              },
              child: Text("Créer"),
            ),
          ],
        );
      },
    );
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
                    Text(playlists[index].name),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.play_arrow),
                    )
                  ],
                ) ,
              )
          ) ,
        ),
        Center(
          child:TextButton(
              onPressed: _createPlaylist,
              child: Text("+ Créer une nouvelle playlist")
          ) ,
        )
      ],
    );
  }



}

