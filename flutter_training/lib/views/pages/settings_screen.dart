import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Paramètre")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            themeProvider.toggleTheme();
          },
          child: Text("Changer le thème de l'application"),
        ),
      ),
    );
  }
}
