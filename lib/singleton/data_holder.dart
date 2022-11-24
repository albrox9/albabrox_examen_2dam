import 'package:albabrox_examen_2dam/widget_views/input_text.dart';

class DataHolder {



  static final DataHolder _dataHolder = DataHolder._internal();

  DataHolder._internal();

  factory DataHolder(){
    return _dataHolder;
  }

}