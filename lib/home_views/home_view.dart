import 'package:albabrox_examen_2dam/custom_views/grid_item.dart';
import 'package:albabrox_examen_2dam/entities/sport.dart';
import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:flutter/material.dart';
import '../data/admin_data.dart';

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
        title: const Text('Welcome'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                itemCount: sportGrid.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridItem(
                    sName: sportGrid[index].name!,
                    index: index,
                    onShortClick: dataSport,
                  );
                }
            ),

            OutlinedButton(
              onPressed: () {
                AdminData().singOut(context);
                // Navigator.of(context).popAndPushNamed('/login_view');
              },
              child: const Text("SING OUT"),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/register_view_sport');
              },
              child: const Icon(Icons.add_circle),
            ),
          ],
      )
    );
  }
}



