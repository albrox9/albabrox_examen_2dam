import 'package:flutter/material.dart';
import '../custom_views/ek_input_text.dart';
import '../data/admin_data.dart';

//En esta clase inserto un nuevo deporte para mostrarlo en la home_view. La pantalla sale cuando le damos al FloatButton.
class RegisterViewSport extends StatefulWidget {
  const RegisterViewSport({Key? key}) : super(key: key);


  @override
  State<RegisterViewSport> createState() => _RegisterViewSport();
}


class _RegisterViewSport extends State<RegisterViewSport> {

  InputIcon itName = InputIcon(
      iWordLength: 20,
      sHelperText: 'Enter name of sport',
      sLabel: "Name's sport",
      iLeadingIcon: const Icon(Icons.face),
      );

  InputIcon itDescription =  InputIcon(
      iWordLength: 100,
      sHelperText: 'Enter deescription of sport',
      sLabel: "Sport's description",
      iLeadingIcon: const Icon(Icons.face),
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
                itDescription,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        /*Solo inserto nombre y descripcion porque la imagen no es comoda y funcional para el usuario
                        Podría insertarla también como un string normal y corriente. Decido no hacerlo porque es poco comodo.
                      */
                        AdminData().insertSport(itName.getText(), itDescription.getText(), context);

                      },
                      child: const Text("CREATE SPORT"),
                    ),

                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed('/home_view');
                      },
                      child: const Text("BACK"),
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


