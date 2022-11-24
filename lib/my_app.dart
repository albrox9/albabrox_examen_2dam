
import 'package:flutter/material.dart';

import 'login_views/splash_view.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget es la raiz de la aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      initialRoute: '/splash_view',
      routes: {
        '/splash_view': (context) => const SplashView(),
      },
    );
  }
}

