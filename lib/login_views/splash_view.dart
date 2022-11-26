
import 'package:albabrox_examen_2dam/data/admin_data.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {

  const SplashView ({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _State();
}

class _State extends State<SplashView> {

  @override
  void initState(){
    super.initState();
    loadData();
  }

  void loadData() async{
    //Función en la que vamos a cargar todos los recursos necesarios (aunque hay cosas que se cargan antes)
      await Future.delayed(const Duration(seconds: 2));


      bool pExist = await AdminData().isGetProfile();


      if(pExist){

        setState(() {
          Navigator.of(context).popAndPushNamed("/home_view");
        });

      } else{

        setState(() {
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
