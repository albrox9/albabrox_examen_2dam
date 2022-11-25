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
          padding: EdgeInsets.all(20.0),
          child: Text("OK"),
        ),
      ),
      // ),
      onPressed: () {
        print('Tapped');
      },
    );
  }
}
