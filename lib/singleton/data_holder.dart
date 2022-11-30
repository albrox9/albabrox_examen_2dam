import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../entities/sport.dart';

class DataHolder {

  //Declaro una instancia de firebase auth.
  FirebaseAuth auth = FirebaseAuth.instance;

  //Declaro una instancia para conectarme a la base de datos, y solo usar esta.
  FirebaseFirestore db = FirebaseFirestore.instance;

  //Declaro e inicializo un objeto para poder acceder a el desde cualquier clase.
  Sport indexSport = Sport();


  static final DataHolder _dataHolder = DataHolder._internal();

  DataHolder._internal();

  factory DataHolder(){
    return _dataHolder;
  }


}