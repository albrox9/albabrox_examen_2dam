import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../entities/profile.dart';

class AdminData{


  Future<Profile?> getProfile() async{

    await Future.delayed(const Duration(seconds: 2));

    print("he entado aqui ya");

    String? idRef = DataHolder().auth.currentUser?.uid;

    final ref = DataHolder().db.collection("profiles").doc(idRef)
        .withConverter(fromFirestore: Profile.fromFirestore,
        toFirestore: (Profile profile, _) => profile.toFirestore(),
    );

    final docSnap = await ref.get();
    final profile = docSnap.data(); // Convert to City object
    if (profile != null) {
      DataHolder().p = profile;
      print("ESTOY DEVOLVIENDO EL PERFIL ROÑOSO");
      return DataHolder().p;
    } else {
      print("NO ESTOY DEVOLVENDO EL PERFIL ROÑOSO");
      return null;
    }



  }

}