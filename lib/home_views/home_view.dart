import 'package:albabrox_examen_2dam/data/admin_data.dart';
import 'package:albabrox_examen_2dam/entities/profile.dart';
import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();


}



class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body:Column(
          children: [
            Text("YA estoy en el puñetero home porfin"),
            OutlinedButton(
              onPressed: () {
                AdminData().singOut();
                Navigator.of(context).popAndPushNamed('/login_view');
              },
              child: const Text("SING OUT"),
            ),
          ],
        )
    );
  }
}
