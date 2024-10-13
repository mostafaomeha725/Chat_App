import 'package:flutter/material.dart';
import 'package:newchat/Model/MessageModel.dart';

class CustomMessageFriend extends StatelessWidget {
  const CustomMessageFriend({super.key, required this.messagelist});
  final MessageModel messagelist;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0xff3e6189),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
                bottomLeft: Radius.circular(22),
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
