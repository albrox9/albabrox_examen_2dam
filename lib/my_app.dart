
import 'package:albabrox_examen_2dam/login_views/login_view.dart';
import 'package:flutter/material.dart';

import 'login_views/splash_view.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget es la raiz de la aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      title: 'Welcome to Flutter',
      initialRoute: '/login_view',
      routes: {
        '/': (context) => const SplashView(),
        '/login_view': (context) => LoginView(),
      },
    );
  }
}

