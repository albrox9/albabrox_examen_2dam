
import 'package:albabrox_examen_2dam/widget_views/input_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  const LoginView({Key? key}) : super(key: key);


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
                  onPressed: () {},
                  child: const Text("Sing up"),
                ),

                OutlinedButton(
                  onPressed: () {},
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
