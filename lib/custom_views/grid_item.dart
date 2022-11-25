import 'package:flutter/material.dart';

class GridItem extends StatelessWidget{

  final String sImgURL;
  final String sName;
  final int index;

  const GridItem({Key? key, required this.sImgURL, required this.sName,
   required this.index}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("No vamos a nigun lado");
      },
      child: Card(
        color: Colors.amber,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(sImgURL),
            Text(sName)
          ],
        ),
      ),
    );
  }
}