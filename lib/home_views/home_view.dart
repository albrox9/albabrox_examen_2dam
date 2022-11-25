import 'package:albabrox_examen_2dam/custom_views/grid_item.dart';
import 'package:albabrox_examen_2dam/entities/sport.dart';
import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:flutter/material.dart';

import '../custom_views/rf_button.dart';

class HomeView extends StatefulWidget {


  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<Sport> sportGrid = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSportCollection();
  }

  void getSportCollection() async {
    final ref = DataHolder().db.collection("sports")
        .withConverter(
      fromFirestore: Sport.fromFirestore,
      toFirestore: (Sport s, _) => s.toFirestore(),
    );

    final docSnap = await ref.get();

    setState(() {
      for (int i = 0; i < docSnap.docs.length; i ++) {
        sportGrid.add(docSnap.docs[i].data());
      }
    });
  }

  void dataSport(int index) {
    DataHolder().indexSport = sportGrid[index];
    Navigator.of(context).popAndPushNamed('/description_view');
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido ${DataHolder().p?.name!}'),

      ),
      body: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            itemCount: sportGrid.length,
            itemBuilder: (BuildContext context, int index) {
              return GridItem(
                sName: sportGrid[index].name!,
                index: index,
                onShortClick: dataSport,
              );
            },
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        // Add your onPressed code here!
        },
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}


/**/


