import 'package:albabrox_examen_2dam/custom_views/ek_input_text.dart';
import 'package:albabrox_examen_2dam/data/admin_data.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  //Aquí implemento el objeto custom con el icono que es la imagen del splash.
  InputIcon itName = InputIcon(
      iWordLength: 20,
      sHelperText: 'Enter username',
      sLabel: 'Username',
      iLeadingIcon: const Icon(Icons.face),
      );

  InputIcon itAge =  InputIcon(
      iWordLength: 20,
      sHelperText: 'Enter age',
      sLabel: 'Age',
      iLeadingIcon: const Icon(Icons.face),
      );

  InputIcon itCity =  InputIcon(
      iWordLength: 20,
      sHelperText: 'Enter city',
      sLabel: 'City',
      iLeadingIcon: const Icon(Icons.location_city),
     );

  InputIcon itCountry =  InputIcon(
      iWordLength: 20,
      sHelperText: 'Enter country',
      sLabel: 'Country',
      iLeadingIcon: const Icon(Icons.location_city),
      );



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
                        //Este boton llama al metodo que está en la clase adminData para hacer el insert de los datos.
                        //No inserto la url de la imagen porque desde el telefono no incomodo para el usuario
                        //Sería igual que cualquier dato string.
                        AdminData().insertProfile(itName.getText(), int.parse(itAge.getText()), itCity.getText(), itCountry.getText(), context);

                      },
                      child: const Text("CREATE PROFILE"),
                    ),

                    OutlinedButton(
                      onPressed: () {
                        //Este boton me desloguea y me devuelve a la loguin view
                        AdminData().singOut(context);

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


