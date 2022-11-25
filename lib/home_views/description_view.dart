import 'package:albabrox_examen_2dam/custom_views/grid_item.dart';
import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionView extends StatefulWidget {
  const DescriptionView({Key? key}) : super(key: key);

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Bienvenido${DataHolder().indexSport.name}'),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(DataHolder().indexSport.name.toString()),
              Text(DataHolder().indexSport.uid.toString()),
              ]
          ),
        )
    );
  }
}
