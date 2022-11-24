
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget es la raiz de la aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      initialRoute: '/splashview',
      routes: {
        '/splashview': (context) => SplashView(),
        '/details': (context) => DetailScreen(),
      };
    }
}