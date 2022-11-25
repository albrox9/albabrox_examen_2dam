import 'package:flutter/material.dart';

import '../widget_views/input_text.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  InputText itName = InputText(
      iWordLength: 20,
      sHelperText: 'Enter username',
      sLabel: 'Username',
      iLeadingIcon: const Icon(Icons.face),
      iTrailingIcon: const Icon(Icons.check_circle),
      bIsPasswordInput: false);

  InputText itAge =  InputText(
      iWordLength: 20,
      sHelperText: 'Enter password',
      sLabel: 'Password',
      iLeadingIcon: const Icon(Icons.lock),
      iTrailingIcon: const Icon(Icons.check_circle),
      bIsPasswordInput: true);

  InputText itCountry =  InputText(
      iWordLength: 20,
      sHelperText: 'Enter password again',
      sLabel: 'Password',
      iLeadingIcon: const Icon(Icons.lock),
      iTrailingIcon: const Icon(Icons.check_circle),
      bIsPasswordInput: true);



  @override
  Widget build(BuildContext context) {
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
                itName,
                itAge,
                itCountry,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text("CREATE PROFILE"),
                    ),

                    OutlinedButton(
                      onPressed: () {},
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


