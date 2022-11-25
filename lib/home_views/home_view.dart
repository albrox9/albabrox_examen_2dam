import 'package:albabrox_examen_2dam/entities/profile.dart';
import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  Profile pHome = DataHolder().p as Profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text(pHome.name.toString()),
        ),
    );
  }
}
