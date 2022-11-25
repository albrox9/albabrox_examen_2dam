import 'package:flutter/material.dart';

class GridItem extends StatelessWidget{

  final String sName;
  final Function (int index) onShortClick;
  final int index;

  const GridItem({Key? key, required this.sName,
   required this.index, required this.onShortClick}) : super(key:key);

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
            Text(sName)
          ],
        ),
      ),
    );
  }
}