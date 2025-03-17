import 'package:flutter/material.dart';
import 'package:flutter_training/views/widgets/all_widget.dart';
import 'package:flutter_training/views/widgets/audio_book_widget.dart';
import 'package:flutter_training/views/widgets/podcasts_widget.dart';
import 'package:flutter_training/views/widgets/songs_widget.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  setIndex({ required int index}){
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: (){ setIndex(index: 0); },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) => _index == 0 ? Colors.green : Colors.transparent
                        ),
                      ),
                      child: const Text("Tout"),
                  ),
                  TextButton(
                      onPressed: (){ setIndex(index: 1); },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) => _index == 1 ? Colors.green : Colors.transparent
                        ),
                      ),
                      child: const Text("Musique"),
                  ),
                  TextButton(
                      onPressed: (){ setIndex(index: 2); },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) => _index == 2 ? Colors.green : Colors.transparent
                        ),
                      ),
                      child: const Text("Podcasts"),
                  ),
                  TextButton(
                      onPressed: (){ setIndex(index: 3); },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) => _index == 3 ? Colors.green : Colors.transparent
                        ),
                      ),
                      child: const Text("Livre audio"),
                  )
                ],
              ),
          SizedBox(
            child:Center(
              child:homeWidgets(index: _index),
            )
          )
        ],
      );
  }

Widget homeWidgets({required int index}){
    switch(index){
      case 0: return  AllWidget();
      case 1: return  SongsWidget();
      case 2: return  PodcastsWidget();
      case 3: return  AudioBookWidget();
      default: return Container();
    }
}

}


