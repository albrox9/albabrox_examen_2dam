import 'package:firebase_auth/firebase_auth.dart';

class DataHolder {

  FirebaseAuth db = FirebaseAuth.instance;
  static final DataHolder _dataHolder = DataHolder._internal();

  DataHolder._internal();

  factory DataHolder(){
    return _dataHolder;
  }

}