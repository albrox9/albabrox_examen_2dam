
import 'package:albabrox_examen_2dam/data/admin_data.dart';
import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {

  const SplashView ({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _State();
}

class _State extends State<SplashView> {

  void initState(){
    super.initState();
    loadData();
  }

  void loadData() async{
    //Función en la que vamos a cargar todos los recursos necesarios (aunque hay cosas que se cargan antes)
      print("Esta en el metodo ya del SPLASHHHHHHHHHHHH ");
      await Future.delayed(const Duration(seconds: 2));

      bool pExist = await AdminData().getProfile();

      if(pExist){

        setState(() {
          print("Evoy a la homeeeeeeeeeeeeeeeea del SPLASHHHHHHHHHHHH ");
          Navigator.of(context).popAndPushNamed("/home_view");
        });

      } else{

        setState(() {
          print("voy al onboardinggggggggggggggggggggggggggSPLASHHHHHHHHHHHHHHHHHHHHHHHHH ");
          Navigator.of(context).popAndPushNamed("/onboarding_view");
        });

      }




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Image(image: AssetImage("assets/image/logo.jpg"), width: 250, height: 200, ),
                  Text("Just breath...",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 23,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold)
                  ),
                  CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                ]

            )
        )
    );
  }
}
