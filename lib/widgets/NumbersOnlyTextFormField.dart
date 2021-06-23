import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumbersOnlyTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData iconData;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String? Function(String?)? validation;

  NumbersOnlyTextFormField(
      {required this.labelText,
      required this.hintText,
      required this.iconData,
      required this.textEditingController,
      required this.textInputType,
      required this.validation});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: TextInputType.number,
      validator: validation,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(iconData),
          ),
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)))),
    );
  }
}
