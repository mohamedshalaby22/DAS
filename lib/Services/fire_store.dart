import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_3/Models/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');
  Future<void> addUserToFirestore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}
