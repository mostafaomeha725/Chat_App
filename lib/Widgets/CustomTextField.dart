import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.onchanged,
      this.icon,
      this.fillColor = Colors.white,
      this.colortext = Colors.black,
      this.onsumbitted,
      this.controller,
      this.obscureText = false});
  final String hint;
  final void Function(String)? onchanged;
  final Widget? icon;
  final Color? fillColor;
  final Color? colortext;
  final void Function(String)? onsumbitted;
  final TextEditingController? controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(color: colortext),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Error';
        }
        return null;
      },
      onChanged: onchanged,
      decoration: InputDecoration(
        suffixIcon: icon,
        fillColor: fillColor,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 26, vertical: 22),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
        border: const OutlineInputBorder(),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
