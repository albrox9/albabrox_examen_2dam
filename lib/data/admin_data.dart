

import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../entities/profile.dart';

//En esta clase tengo los metodos para insertar perfil y deporte. Además del metodo logout y comprobar el perfil
class AdminData{


  //inserta un nuevo perfil.
  void insertProfile(String name, int age, String city, String country, BuildContext context) async {

    Profile p = Profile(name: name, country: country, city: city, age: age);

    await DataHolder().db.collection("profiles").doc(DataHolder().auth.currentUser?.uid).
    set(p.toFirestore()).
    onError((e, _) => print("Error writing document: $e"));

    Navigator.of(context).popAndPushNamed("/home_view");
  }

  //Comprueba si hay o no perfil.
  Future <bool> isGetProfile() async {

    String? idUser = DataHolder().auth.currentUser?.uid;

    final docRef = DataHolder().db.collection("profiles").doc(idUser)
        .withConverter(fromFirestore: Profile.fromFirestore,
      toFirestore: (Profile profile, _) => profile.toFirestore(),
    );

    DocumentSnapshot docsnap = await docRef.get();
    return docsnap.exists;

  }


  //Añadir un nuevo deporte
  void insertSport(String name, String description, BuildContext context) async {

    // Add a new document with a generated id.
    final sport = {"name": name, "description": description, "image": ""};

    DataHolder().db.collection("sports").add(sport).then((documentSnapshot) =>
        print("Added Data with ID: ${documentSnapshot.id}"));


    Navigator.of(context).popAndPushNamed("/home_view");
  }

  //Metodo de deslogueo
  void singOut(context) async{

    await DataHolder().auth.signOut();
    Navigator.of(context).popAndPushNamed('/login_view');

  }



  }

