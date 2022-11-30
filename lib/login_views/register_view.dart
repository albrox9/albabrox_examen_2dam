
import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_views/input_text.dart';


class RegisterView extends StatelessWidget {

  const RegisterView({Key? key}) : super(key: key);

  //función que realiza el registro.
  void singUp(String emailAddress, String password, BuildContext context) async{

    try {

      //Crea la nueva cuenta en la base de datos.
      await DataHolder().auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      Navigator.of(context).popAndPushNamed('/login_view');

    } on FirebaseAuthException catch (e) {

      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }

    } catch (e) {
      debugPrint(e.toString());
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

    InputText itPassRep =  InputText(
        iWordLength: 20,
        sHelperText: 'Enter password again',
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
        child: SingleChildScrollView( //Evita que el teclado tape los input.
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            itUser,
            itPass,
            itPassRep,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                     if(itPass.getText() == itPassRep.getText()){
                       singUp(itUser.getText(), itPass.getText(), context);
                     }
                  },
                  child: const Text("Ok"),
                ),

                OutlinedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/login_view');

                  },
                  child: const Text("Cancel"),
                )
              ],
            )
          ],
        ),

        )

      ),
    );
  }
}





