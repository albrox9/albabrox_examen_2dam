
import 'package:albabrox_examen_2dam/home_views/home_view.dart';
import 'package:albabrox_examen_2dam/login_views/login_view.dart';
import 'package:flutter/material.dart';

import 'login_views/onboarding_view.dart';
import 'login_views/register_view.dart';
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
      initialRoute: '/',
      //FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/profile',
      routes: {
        '/': (context) => const SplashView(),
        '/login_view': (context) => const LoginView(),
        '/register_view':(context) => const RegisterView(),
        '/home_view':(context) => const HomeView(),
        '/onboarding_view':(context) => const OnBoardingView(),

      },
    );
  }
}

