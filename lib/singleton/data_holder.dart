import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../entities/sport.dart';

class DataHolder {

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  Sport indexSport = Sport();


  static final DataHolder _dataHolder = DataHolder._internal();

  DataHolder._internal();

  factory DataHolder(){
    return _dataHolder;
  }


}