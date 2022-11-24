
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {

  const SplashView ({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _State();
}

class _State extends State<SplashView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Image(image: AssetImage("assets/image/logo.jpg"), width: 250, height: 200, ),
                  Text("Just breath...",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 23,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold)
                  ),
                  CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                ]

            )
        )
    );
  }
}
