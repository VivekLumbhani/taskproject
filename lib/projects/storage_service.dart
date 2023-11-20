import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
class storagee{
  final firebase_storage.FirebaseStorage storage=firebase_storage.FirebaseStorage.instance;
  Future<void> uploadFile(String filepath, String filename)async{
    File file=File(filepath);
    try{
      await storage.ref('/images/$filename').putFile(file);
    }on firebase_core.FirebaseException catch(e){
      print(e);
    }
  }
  Future<firebase_storage.ListResult> listFiles() async {
    try {
      firebase_storage.ListResult result = await storage.ref('images').listAll();
      result.items.forEach((firebase_storage.Reference ref) {
        print("files found are $ref");
      });
      return result;
    } catch (error) {
      print("Error fetching files: $error");
      throw error;
    }
  }

}