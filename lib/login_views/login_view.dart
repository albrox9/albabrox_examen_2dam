
import 'package:albabrox_examen_2dam/widget_views/input_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  const LoginView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    InputText itUser = const InputText(
        iWordLength: 20,
        sHelperText: 'Enter username',
        sLabel: 'Username',
        iLeadingIcon: Icon(Icons.account_circle),
        iTrailingIcon: Icon(Icons.face),
        bIsPasswordInput: false);

    InputText itPass = const InputText(
        iWordLength: 20,
        sHelperText: 'Enter username',
        sLabel: 'Username',
        iLeadingIcon: Icon(Icons.password),
        iTrailingIcon: Icon(Icons.password_sharp),
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
