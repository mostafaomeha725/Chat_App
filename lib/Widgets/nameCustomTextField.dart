import 'package:flutter/material.dart';

class NameCustomTextField extends StatelessWidget {
  const NameCustomTextField({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
