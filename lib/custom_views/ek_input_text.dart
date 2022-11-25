import 'package:flutter/material.dart';

class InputIcon extends StatelessWidget {

  final int iWordLength;
  final String sHelperText;
  final String sLabel;
  final Icon iLeadingIcon;


  InputIcon({Key? key,
    required this.iWordLength,
    required this.sHelperText,
    required this.sLabel,
    required this.iLeadingIcon,})
      : super(key: key);

  final _myController = TextEditingController();

  String getText(){
    return _myController.text;
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      child: TextFormField(
        controller: _myController,
        maxLength: iWordLength,

        decoration: InputDecoration(
          labelText: sLabel,
          helperText: sHelperText,
          border: const OutlineInputBorder(),
          prefixIcon: iLeadingIcon,
          suffixIcon: Image.asset('assets/icon/logo.ico', scale: 5.5,),
          //const ImageIcon(AssetImage('assets/icon/logo.ico'), size: 10.5,),
        ),
      ),
    );
  }
}
