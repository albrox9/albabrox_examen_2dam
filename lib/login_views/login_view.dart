
import 'package:albabrox_examen_2dam/data/admin_data.dart';
import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../custom_views/input_text.dart';

class LoginView extends StatelessWidget {


  const LoginView({Key? key}) : super(key: key);

  //logica de la clase login. Creamos la funcion asincrona que comprueba usuario y contraseña.
  void singIn(String emailAddress, String password, BuildContext context) async{

    await Future.delayed(const Duration(seconds: 1));

    try {

      //Comprueba el usuario y la contraseña.
      await DataHolder().auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,

      );

      //repito la comprobación del splash, para ver si el usuario que se acaba de loguear tiene perfil o no.
      bool pExist = await AdminData().isGetProfile();

      //Si tiene perfil me lleva a la home
      if(pExist){
        Navigator.of(context).popAndPushNamed("/home_view");

        //Si no tiene perfil, va al onboardin
      } else {
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

                //Este botón es para registrar un nuevo usuario.
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/register_view');
                  },
                  child: const Text("Register"),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
