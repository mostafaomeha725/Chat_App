import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:newchat/Views/LoginView.dart';
import 'package:newchat/Widgets/CustomButtom.dart';
import 'package:newchat/Widgets/CustomTextField.dart';
import 'package:newchat/Widgets/nameCustomTextField.dart';
import 'package:newchat/cubit/registar_cubit.dart';

class BodyRegistarView extends StatefulWidget {
  const BodyRegistarView({super.key});

  @override
  State<BodyRegistarView> createState() => _BodyRegistarViewState();
}

class _BodyRegistarViewState extends State<BodyRegistarView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email;
  bool isLoading = false;
  String? password;
  bool showpassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistarCubit, RegistarState>(
      listener: (context, state) {
        if (state is RegistarFailure) {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        } else if (state is RegistarSuccess) {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration succeeded')),
          );

          Navigator.pushNamed(context, LoginView.id);
        } else if (state is RegistarLoading) {
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
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const Text(
                          'Registar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Create a new account',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const NameCustomTextField(text: 'Username'),
                        const SizedBox(
                          height: 12,
                        ),
                        const CustomTextField(
                          hint: 'Username',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const NameCustomTextField(
                          text: 'Email',
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
                        const NameCustomTextField(text: 'Password'),
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
                          obscureText: showpassword,
                          hint: 'Password',
                          onchanged: (value) {
                            password = value;
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomButon(
                          text: 'Registar',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<RegistarCubit>(context)
                                  .registar(email: email!, password: password!);
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
                              'Already have account?  ',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 18,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push((context), MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginView();
                                  },
                                ));
                              },
                              child: const Text(
                                'Login',
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
}
