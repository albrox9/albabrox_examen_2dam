import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

  final int iWordLength;
  final String sHelperText;
  final String sLabel;
  final Icon iLeadingIcon;
  final Icon iTrailingIcon;
  final bool bIsPasswordInput;


      InputText({Key? key,
    required this.iWordLength,
    required this.sHelperText,
    required this.sLabel,
    required this.iLeadingIcon,
    required this.iTrailingIcon,
    required this.bIsPasswordInput,})
      : super(key: key);

  final _myController = TextEditingController();

  String getText(){
    return _myController.text;
  }


//Clase custom de los input text
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
        obscureText: bIsPasswordInput,

          decoration: InputDecoration(
          labelText: sLabel,
          helperText: sHelperText,
          border: const OutlineInputBorder(),
          prefixIcon: iLeadingIcon,
          suffixIcon: iTrailingIcon,
        ),
      ),
    );
  }
}
