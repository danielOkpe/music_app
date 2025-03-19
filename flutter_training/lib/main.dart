import 'package:flutter/material.dart';
import 'package:flutter_training/controllers/app_navigator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/providers/theme_provider.dart';
import 'views/pages/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeProvider themeProvider = await ThemeProvider.create();

  runApp( 
    ChangeNotifierProvider(
        create:(event) => themeProvider,
        child:MyApp()
      ,
    )
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeProvider.themeData,
            home: const AppNavigator(),
          );
        }
    );

  }
}

