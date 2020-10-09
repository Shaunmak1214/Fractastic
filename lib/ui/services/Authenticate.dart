import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fractastic/constants.dart';
import 'package:fractastic/model/User.dart';
import 'package:fractastic/model/Class.dart';
import 'package:fractastic/ui/utils/helper.dart';

import '../../main.dart';

class FireStoreUtils {
  static Firestore firestore = Firestore.instance;
  static DocumentReference currentUserDocRef =
      firestore.collection(USERS).document(MyAppState.currentUser.userID);
  StorageReference storage = FirebaseStorage.instance.ref();

  final CollectionReference userCollection = firestore.collection(USERS);
  final CollectionReference classCollection = firestore.collection(CLASSES);

  Future<User> getCurrentUser(String uid) async {
    DocumentSnapshot userDocument =
        await firestore.collection(USERS).document(uid).get();
    if (userDocument != null && userDocument.exists) {
      return User.fromJson(userDocument.data);
    } else {
      return null;
    }
  }

  Future<Class> getClass(String cid) async {
    DocumentSnapshot classDocument =
        await firestore.collection(CLASSES).document(cid).get();
    if (classDocument != null && classDocument.exists) {
      return Class.fromJson(classDocument.data);
    } else {
      return null;
    }
  }

  Future<User> updateCurrentUser(User user, BuildContext context) async {
    return await firestore
        .collection(USERS)
        .document(user.userID)
        .setData(user.toJson())
        .then((document) {
      return user;
    }, onError: (e) {
      print(e);
      showAlertDialog(context, 'Error', 'Failed to Update, Please try again.');
      return null;
    });
  }

  Future<Class> updateClassData(
      Class currentClass, BuildContext context) async {
    return await firestore
        .collection(CLASSES)
        .document(currentClass.cid)
        .setData(currentClass.toJson())
        .then((document) {
      return currentClass;
    }, onError: (e) {
      print(e);
      showAlertDialog(context, 'Error', 'Failed to Update, Please try again.');
      return null;
    });
  }

  Future<String> uploadUserImageToFireStorage(File image, String userID) async {
    StorageReference upload = storage.child("images/$userID.png");
    StorageUploadTask uploadTask = upload.putFile(image);
    var downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    return downloadUrl.toString();
  }

  Stream<List<Class>> get classes {
    return classCollection.snapshots().map(_classListFromSnapshot);
  }

  List<Class> _classListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Class.fromJson(doc.data);
    }).toList();
  }
}
