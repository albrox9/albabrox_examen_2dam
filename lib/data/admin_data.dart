import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../entities/profile.dart';

class AdminData{


  Future <bool> getProfile() async {

    String? idUser = DataHolder().auth.currentUser?.uid;

    final docRef = DataHolder().db.collection("profiles").doc(idUser)
        .withConverter(fromFirestore: Profile.fromFirestore,
      toFirestore: (Profile perfil, _) => perfil.toFirestore(),
    );

    DocumentSnapshot docsnap = await docRef.get();
    return docsnap.exists;

  }

  void singOut(){

    DataHolder().auth.signOut();

  }



  }

