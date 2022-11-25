import 'package:albabrox_examen_2dam/data/admin_data.dart';
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
      sHelperText: 'Enter age',
      sLabel: 'Age',
      iLeadingIcon: const Icon(Icons.face),
      iTrailingIcon: const Icon(Icons.check_circle),
      bIsPasswordInput: false);

  InputText itCity =  InputText(
      iWordLength: 20,
      sHelperText: 'Enter city',
      sLabel: 'City',
      iLeadingIcon: const Icon(Icons.location_city),
      iTrailingIcon: const Icon(Icons.check_circle),
      bIsPasswordInput: false);

  InputText itCountry =  InputText(
      iWordLength: 20,
      sHelperText: 'Enter country',
      sLabel: 'Country',
      iLeadingIcon: const Icon(Icons.location_city),
      iTrailingIcon: const Icon(Icons.check_circle),
      bIsPasswordInput: false);



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
                itCity,
                itCountry,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        AdminData().insertProfile(itName.getText(), int.parse(itAge.getText()), itCity.getText(), itCountry.getText(), context);

                      },
                      child: const Text("CREATE PROFILE"),
                    ),

                    OutlinedButton(
                      onPressed: () {
                        AdminData().singOut(context);
                       // Navigator.of(context).popAndPushNamed('/login_view');
                      },
                      child: const Text("SING OUT"),
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


