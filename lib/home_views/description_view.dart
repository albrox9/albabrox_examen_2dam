import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:flutter/material.dart';
import '../custom_views/rf_button.dart';

class DescriptionView extends StatefulWidget {
  const DescriptionView({Key? key}) : super(key: key);

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {

  RFButton button = const RFButton();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Welcome to ${DataHolder().indexSport.name} page'),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(DataHolder().indexSport.image.toString()),
              Text(DataHolder().indexSport.name.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 35,
                fontWeight: FontWeight.bold,),
              ),
              Text(DataHolder().indexSport.description.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              button,
              ]
          ),
        )
    );
  }
}
