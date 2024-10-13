import 'package:flutter/material.dart';
import 'package:newchat/Widgets/BodyChatView.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static String id = 'ChatView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyChatView(),
    );
  }
}
