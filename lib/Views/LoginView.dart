import 'package:flutter/material.dart';
import 'package:newchat/Widgets/BodyLoginView.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: BodyLoginView(),
    );
  }
}
