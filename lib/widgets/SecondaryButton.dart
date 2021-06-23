import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function() onPress;

  SecondaryButton({required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(text),
    );
  }
}
