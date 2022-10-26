import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(this.text, {required this.onPressed, this.color = Colors.orange, Key? key}) : super(key: key);

  final String text;
  final Function() onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
      ),
    );
  }
}
