import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

  final int iWordLength;
  final String sHelperText;
  final String sLabel;
  final Icon iLeadingIcon;
  final Icon iTrailingIcon;
  final bool bIsPasswordInput;




  const InputText({Key? key,
    required this.iWordLength,
    required this.sHelperText,
    required this.sLabel,
    required this.iLeadingIcon,
    required this.iTrailingIcon,
    required this.bIsPasswordInput,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      child: TextFormField(
        maxLength: iWordLength,
        obscureText: bIsPasswordInput,

          decoration: InputDecoration(
          labelText: sLabel,
          helperText: sHelperText,
          border: OutlineInputBorder(),
          prefixIcon: iLeadingIcon,
          suffixIcon: iTrailingIcon,
        ),
      ),
    );
  }
}
