import 'package:flutter/material.dart';
import 'package:newchat/Model/MessageModel.dart';

class CustomMessage extends StatelessWidget {
  const CustomMessage({super.key, required this.messagelist});
  final MessageModel messagelist;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0xff222e3a),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
                bottomRight: Radius.circular(22),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            child: Text(
              messagelist.message,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
