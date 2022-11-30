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

  //Con este metodo se descargara la coleccion de deportes de la base de datos.
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

  //Al hacer click, le pasamod el indice al objeto y nos lleva a su descripcion correspodiente.
  void dataSport(int index) {
    DataHolder().indexSport = sportGrid[index];
    Navigator.of(context).popAndPushNamed('/description_view');
  }

  //En esta vista, he añadido un scroll. a parte de la vista de los item tiene dos botones.
  //Un botón de logout, y el floatbutton con el que añadir un nuevo item.
  //Es necesario hacer scroll hacia abajo para verlos.

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GridView.builder( //HACER SCROLL PARA VER LOS BOTONES.
              physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                itemCount: sportGrid.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridItem(
                    sName: sportGrid[index].name!,
                    sImage: sportGrid[index].image!,
                    index: index,
                    onShortClick: dataSport,
                  );
                }
            ),


            OutlinedButton( //Me desloguea de la aplicacion.
              onPressed: () {
                AdminData().singOut(context);
                // Navigator.of(context).popAndPushNamed('/login_view');
              },
              child: const Text("SING OUT"),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton(//Añade un nuevo item llevandome a la pagina de registro del deporte.
        onPressed: () {
          Navigator.of(context).popAndPushNamed('/register_view_sport');
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueGrey.shade200,
      ),
    );
  }
}



