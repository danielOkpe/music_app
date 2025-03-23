import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/models/save/prefs.dart';
import 'package:flutter_training/models/tabs.dart';
import 'package:flutter_training/views/pages/home_screen.dart';
import 'package:flutter_training/views/pages/library_screen.dart';
import 'package:flutter_training/views/pages/profile_screen.dart';
import 'package:flutter_training/views/pages/search_screen.dart';
import 'package:flutter_training/views/pages/settings_screen.dart';


class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int _curentIndex = 0;


  final List<Tabs> _bottomTabs = [
    Tabs(name: "Accueil", icon: Icons.home, widget: HomeScreen()),
    Tabs(name: "Recherche", icon: Icons.search, widget: SearchScreen()),
    Tabs(name: "Bibliothèque", icon: Icons.library_add, widget: LibraryScreen()),
    Tabs(name: "Profile", icon: Icons.person, widget: ProfileScreen()),
    Tabs(name: "Paramètres", icon: Icons.settings, widget: SettingsScreen())
  ];


  _changeIndex(int index){
    setState(() {
      Navigator.pop(context);
      _curentIndex = index;
    });
  }




@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
            child: const Center(
              child: Text("DLHITS"),
            )
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){
                          _changeIndex(3);
                        },
                        icon: const Icon(Icons.person)
                    ),
                    const Text("Mon profile")
                  ],
                )
            ),
            Row(
              children: [
                IconButton(
                    onPressed: (){
                      _changeIndex(4);
                    },
                    icon: const Icon(Icons.settings)
                ),
                const Text("Paramètres")
              ],
            )
          ],
        ),
      ),
      body: _bottomTabs[_curentIndex].widget,
      bottomNavigationBar: SafeArea(
          child: BottomNavigationBar(
            items:_bottomTabs.take(3).map((t) => t.item).toList(),
            currentIndex: _curentIndex < 3 ? _curentIndex : 0,
            onTap: (newIndex){
              setState(() {
                _curentIndex = newIndex;
              });
            },
            selectedItemColor:_curentIndex < 3 ? Colors.green : Colors.grey,
            unselectedItemColor:Colors.grey,
          ),
      )
    );
  }
}
