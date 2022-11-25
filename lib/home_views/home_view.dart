import 'package:albabrox_examen_2dam/custom_views/grid_item.dart';
import 'package:albabrox_examen_2dam/data/admin_data.dart';
import 'package:albabrox_examen_2dam/entities/profile.dart';
import 'package:albabrox_examen_2dam/singleton/data_holder.dart';
import 'package:flutter/material.dart';

import '../custom_views/rf_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();


}



class _HomeViewState extends State<HomeView> {

  List<GridItem> sportGrid = [];
  RFButton button = const RFButton();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido${DataHolder().perfil.name!}'),

      ),
      body: Center(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3
              ),
              itemCount: sportGrid.length,
              itemBuilder: (BuildContext context, int index){
                return GridItem(
                    sImgURL: sportGrid[index].image!,
                    sName: sportGrid[index].name!,
                    onShortClick: listItemShortClicked,
                    index: index);
              },
          )
      ),
    );
  }
}
/*OutlinedButton(
              onPressed: () {
                AdminData().singOut(context);
                },
              child: const Text("SING OUT"),
              ),
              button,*/


