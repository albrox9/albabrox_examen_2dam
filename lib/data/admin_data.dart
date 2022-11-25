import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../entities/profile.dart';

class AdminData{

  void insertProfile(String name, int age, String city, String country, BuildContext context) async {

    Profile p = Profile(name: name, country: country, city: city, age: age);

    await DataHolder().db.collection("profiles").doc(DataHolder().auth.currentUser?.uid).
    set(p.toFirestore()).
    onError((e, _) => print("Error writing document: $e"));

    Navigator.of(context).popAndPushNamed("/home_view");
  }


  Future <bool> getProfile() async {

    String? idUser = DataHolder().auth.currentUser?.uid;

    final docRef = DataHolder().db.collection("profiles").doc(idUser)
        .withConverter(fromFirestore: Profile.fromFirestore,
      toFirestore: (Profile perfil, _) => perfil.toFirestore(),
    );

    DocumentSnapshot docsnap = await docRef.get();
    return docsnap.exists;

  }

  void singOut(context) async{
    print("ME DESLOGUESOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
    await DataHolder().auth.signOut();
    Navigator.of(context).popAndPushNamed('/login_view');

  }



  }

