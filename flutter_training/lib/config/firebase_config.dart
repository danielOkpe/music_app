import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_training/firebase_options.dart';

class FirebaseConfig{
  static dynamic initialize;


 static initFirebase() async{
    initialize =  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return initialize;
  }
}
