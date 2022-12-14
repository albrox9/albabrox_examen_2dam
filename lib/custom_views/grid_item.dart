import 'package:flutter/material.dart';

class GridItem extends StatelessWidget{

  final String sName;
  final String sImage;
  final Function (int index) onShortClick;
  final int index;

  const GridItem({Key? key, required this.sName,
   required this.index, required this.onShortClick, required this.sImage, }) : super(key:key);

  //Clase que muestra las card de los grid.
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onShortClick(index);
      },
      child: Card(
        color: Colors.amber,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(sImage),
            Text(sName,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ],
        ),
      ),
    );
  }
}