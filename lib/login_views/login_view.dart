
import 'package:albabrox_examen_2dam/data/admin_data.dart';
import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:albabrox_examen_2dam/widget_views/input_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../entities/profile.dart';

class LoginView extends StatelessWidget {


  const LoginView({Key? key}) : super(key: key);

  //logica de la clase login. Creamos la funcion asincrona que comprueba usuario y contraseña.
  void singIn(String emailAddress, String password, BuildContext context) async{

    await Future.delayed(const Duration(seconds: 1));
    print("E entrado al loign");

    try {
      await DataHolder().auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,

      );

      print("E entrado a comprobar estoooooooooooooooooooooooooooooooooooooooooooooooooo");
      bool pExist = await AdminData().getProfile();

      if(pExist){
        print("ME voy a la homeeeeeeeeeeeeeeeeeeeeeeeeeee");
        Navigator.of(context).popAndPushNamed("/home_view");

      } else {
        print("Me voy al onboardinggggggggggggggggggggggggg");
        Navigator.of(context).popAndPushNamed("/onboarding_view");
      }

    } on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');

      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }


  }


  @override
  Widget build(BuildContext context) {

    InputText itUser = InputText(
        iWordLength: 20,
        sHelperText: 'Enter username',
        sLabel: 'Username',
        iLeadingIcon: const Icon(Icons.face),
        iTrailingIcon: const Icon(Icons.check_circle),
        bIsPasswordInput: false);

    InputText itPass =  InputText(
        iWordLength: 20,
        sHelperText: 'Enter password',
        sLabel: 'Password',
        iLeadingIcon: const Icon(Icons.lock),
        iTrailingIcon: const Icon(Icons.check_circle),
        bIsPasswordInput: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to the Adventurer'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            itUser,
            itPass,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {

                    //llamamos a la función que controla el login
                    singIn(itUser.getText(), itPass.getText(), context);
                  },
                  child: const Text("Sing up"),
                ),

                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/register_view');
                  },
                  child: const Text("Register"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
