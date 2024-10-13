import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:newchat/Views/ChatView.dart';
import 'package:newchat/Views/RegistarView.dart';
import 'package:newchat/Widgets/CustomButtom.dart';
import 'package:newchat/Widgets/CustomTextField.dart';
import 'package:newchat/cubit/LoginCubit/login_cubit.dart';

import '../cubit/cubit/chat_cubit.dart';

class BodyLoginView extends StatefulWidget {
  const BodyLoginView({super.key});

  @override
  State<BodyLoginView> createState() => _BodyLoginViewState();
}

class _BodyLoginViewState extends State<BodyLoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? password;
  bool isLoading = false;
  bool showpassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          isLoading = false;
          showsnakebar(context, state.errMessage);
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          isLoading = false;
          Navigator.pushNamed(context, ChatView.id);
        } else if (state is LoginLoading) {
          isLoading = true;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset('assets/IMG_5618.PNG'),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Login to Your account',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextField(
                          hint: 'Email',
                          onchanged: (value) {
                            email = value;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextField(
                          icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showpassword = !showpassword;
                                });
                              },
                              icon: Icon(
                                showpassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.blue,
                              )),
                          hint: 'Password',
                          onchanged: (value) {
                            password = value;
                          },
                          obscureText: showpassword,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomButon(
                          text: 'Login',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context)
                                  .login(email: email!, password: password!);
                            } else {}
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dont have account?  ',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 18,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, RegistarView.id);
                              },
                              child: const Text(
                                'Create Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showsnakebar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }
}

String? email;
