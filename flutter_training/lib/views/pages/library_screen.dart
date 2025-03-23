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
        return StatefulBuilder(
            builder: (context, setDialogState){
              return  AlertDialog(
                title: Text("Créer une playlist"),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(labelText: "Nom de la playlist"),
                      ),
                      SizedBox(height: 10),
                      Text("Sélectionner des musiques"),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 200,
                        width: double.maxFinite,
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: allAudios.map((audio) {
                              bool isSelected = selectedAudios.contains(audio);

                              return ElevatedButton(
                                onPressed: () {
                                  setDialogState((){
                                    if (isSelected) {
                                        selectedAudios.remove(audio);
                                    } else {
                                        selectedAudios.add(audio);
                                    }
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: isSelected? Colors.green : Colors.transparent
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
            }
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        SizedBox(
          height: 150,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
            child:ListView.builder(
                itemCount: playlists.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Padding(
                      padding: EdgeInsets.only(left: 16.0),
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
                  ),
                )
            ),

          ),
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

