import 'package:flutter/material.dart';
import 'package:flutter_training/controllers/services/dto_service.dart';
import 'package:flutter_training/controllers/services/functions_service.dart';
import 'package:flutter_training/models/DTO/audioDTO.dart';
import 'package:flutter_training/models/DTO/playlistDTO.dart';
import 'package:flutter_training/models/playlist.dart';
import 'package:flutter_training/views/pages/playlist_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late List<Playlist> allPlaylists;
  late List<AudioDTO> allAudios;
  bool isLoad = true;

  initPlaylists() async{
    dynamic resPlaylist = await FunctionsService.getAllOtherPlaylist();

    if(resPlaylist is List){
      List<PlaylistDTO> playlistsDTO =  resPlaylist.map((e) => PlaylistDTO.fromJson(e)).toList();
      List<Playlist> playlists = await DTOService.convertDTOsToPlaylists(playlistsDTO);

      setState(() {
        allPlaylists = playlists;
        isLoad = false;
      });
    }
  }

  initAudios() async {
    dynamic resAudio = await FunctionsService.getAllAudios();

    print(resAudio);
    if(resAudio is List){
      List<AudioDTO> audiosDTO =  resAudio.map((e) => AudioDTO.fromJson(e)).toList();

      setState(() {
        allAudios = audiosDTO;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlaylists();
  }

  void _createPlaylist() async {
    TextEditingController nameController = TextEditingController();
    List<AudioDTO> selectedAudios = [];
    await initAudios();

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
                    onPressed: ()async {
                      if (nameController.text.isNotEmpty && selectedAudios.isNotEmpty) {
                        Playlist playlist = Playlist(name: nameController.text,playlist:await DTOService.convertDTOsToAudiosWithoutImg(selectedAudios));
                        print("the normal playlist: ${playlist.playlist}");

                        PlaylistDTO playlistDTO = DTOService.convertPlaylistToDTO(playlist);

                        print("the DTO playlist: ${playlistDTO.playlist[0].toJSON()}");
                        setState(() {
                          allPlaylists.add(playlist);
                        });
                        var response = await FunctionsService.createPlaylist(playlist: playlistDTO);
                        print("created playlist: $response");
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
    return isLoad
      ?const Center(child: CircularProgressIndicator())
    :
      Column(
      children: [
        SizedBox(height: 20,),
        SizedBox(
          height: 150,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
            child:ListView.builder(
                itemCount: allPlaylists.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(allPlaylists[index].name),
                          IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistScreen(playlist: allPlaylists[index]) ));
                            },
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

