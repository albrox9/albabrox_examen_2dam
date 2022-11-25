import 'package:albabrox_examen_2dam/home_views/home_view.dart';
import 'package:flutter/material.dart';

class RFButton extends StatelessWidget {
  const RFButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(8.0),
      textColor: Colors.black,
      splashColor: Colors.amberAccent,
      elevation: 20.0,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/logo.jpg'),
              fit: BoxFit.cover),
        ),
        child: const Padding(
          padding: EdgeInsets.all(43.0),
          child: Text("BACK"),
        ),
      ),
      // ),
      onPressed: () {
        Navigator.of(context).popAndPushNamed('/home_view');
      },
    );
  }
}

