import 'package:albabrox_examen_2dam/data/admin_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/profile.dart';

class DataHolder {

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  Profile? p;

  static final DataHolder _dataHolder = DataHolder._internal();

  DataHolder._internal();

  factory DataHolder(){
    return _dataHolder;
  }


}