
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
class Storage{
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
 

  Future<String> uploadAvatar(String userId,Uint8List bytes ) async{
    Reference ref = _firebaseStorage.ref('Avatars');
    final UploadTask uploadTask = ref.putData(bytes);
    final TaskSnapshot taskSnapshot = uploadTask.snapshot;
    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}

Storage storage = Storage();