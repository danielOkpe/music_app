
import 'package:firebase_storage/firebase_storage.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();
class FirebaseStorageService{

  static Future<String> getUrl(String path) async{
    if(path.isEmpty){
      throw Exception("the path is empty");
    }

    try{
      List<String> children = path.split('/');
      var urlRef = firebaseStorage
          .child(children[0])
          .child(children[1]);
      String url = await urlRef.getDownloadURL();
      return url;
    }catch(e){
        throw Exception(e);
    }
  }



}