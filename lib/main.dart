import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newchat/Views/ChatView.dart';
import 'package:newchat/Views/LoginView.dart';
import 'package:newchat/Views/RegistarView.dart';
import 'package:newchat/cubit/LoginCubit/login_cubit.dart';
import 'package:newchat/cubit/cubit/chat_cubit.dart';
import 'package:newchat/cubit/registar_cubit.dart';

import 'BlocObserve/Simple_Bloc_Observe.dart';
import 'firebase_options.dart';

void main() async {
  Bloc.observer = SimpleBlocObserve();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Newchat());
}

class Newchat extends StatelessWidget {
  const Newchat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegistarCubit>(
          create: (BuildContext context) => RegistarCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider<ChatCubit>(
          create: (BuildContext context) => ChatCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginView.id,
        routes: {
          LoginView.id: (context) => const LoginView(),
          RegistarView.id: (context) => const RegistarView(),
          ChatView.id: (context) => const ChatView(),
        },
      ),
    );
  }
}
