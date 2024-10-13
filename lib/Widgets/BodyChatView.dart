import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newchat/Model/MessageModel.dart';
import 'package:newchat/Widgets/BodyLoginView.dart';
import 'package:newchat/Widgets/CustomMessage.dart';
import 'package:newchat/cubit/cubit/chat_cubit.dart';

import 'CustomMessageFriend.dart';
import 'CustomTextField.dart';

class BodyChatView extends StatefulWidget {
  const BodyChatView({super.key});

  @override
  State<BodyChatView> createState() => _BodyChatViewState();
}

String? message;
List<MessageModel> messagelist = [];
TextEditingController messageController = TextEditingController();
ScrollController controller = ScrollController();

class _BodyChatViewState extends State<BodyChatView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/IMG_5622.PNG'),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state is ChatSuccess) {
            messagelist = state.myList;
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListView.builder(
                      reverse: true,
                      controller: controller,
                      itemCount: messagelist.length,
                      itemBuilder: (context, index) {
                        return messagelist[index].id == email
                            ? CustomMessage(
                                messagelist: messagelist[index],
                              )
                            : CustomMessageFriend(
                                messagelist: messagelist[index],
                              );
                      }),
                ),
              ),
              CustomTextField(
                controller: messageController,
                hint: 'Message',
                onchanged: (value) {
                  message = value;
                },
                icon: IconButton(
                    onPressed: () {
                      messagelist.clear();

                      BlocProvider.of<ChatCubit>(context)
                          .sendMessage(message: message!);
                      messageController.clear();
                      if (controller.hasClients) {
                        controller.animateTo(
                          0,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                        );
                      }
                    },
                    icon: const Icon(Icons.send)),
                fillColor: const Color(0xff50555c),
                colortext: Colors.white,
              ),
            ],
          );
        },
      ),
    );
  }
}
