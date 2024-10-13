import 'package:flutter/material.dart';

import '../Widgets/BodyRegistarView.dart';

class RegistarView extends StatelessWidget {
  const RegistarView({super.key});
  static String id = 'RegistarView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: BodyRegistarView(),
    );
  }
}
