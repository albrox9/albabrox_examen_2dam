
import 'package:albabrox_examen_2dam/data/admin_data.dart';
import 'package:flutter/material.dart';

import '../singleton/data_holder.dart';

class SplashView extends StatefulWidget {

  const SplashView ({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _State();
}

class _State extends State<SplashView> {

  @override
  void initState(){
    super.initState();

    //El metodo se ejecuta una vez que entra a la clase ya que está en el init state.
    loadData();
  }

  void loadData() async {
    //Con el Future le damos tiempo a la app a que cargue los datos.
    await Future.delayed(const Duration(seconds: 2));

    //Con esta linea comprobamos si está logueado o no, el usuario. Si no está logueado, va a la login
    //Una vez que se logue, en la loginview, volvemos a comprobar si tiene perfil o no (en la login).
    if (DataHolder().auth.currentUser == null) {

      setState(() {
        Navigator.of(context).popAndPushNamed("/login_view");
      });

      //Despues, si el usuario está logueado, comprueba si tiene perfil o no.
    } else {
      bool pExist = await AdminData().isGetProfile();

      if (pExist) {
        setState(() {
          Navigator.of(context).popAndPushNamed("/home_view");
        });
      } else {
        setState(() {
          Navigator.of(context).popAndPushNamed("/onboarding_view");
        });
      }
    }
  }

  void createProfile(){

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
