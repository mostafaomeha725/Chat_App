import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:newchat/Constants.dart';
import 'package:newchat/Model/MessageModel.dart';
import 'package:newchat/Widgets/BodyLoginView.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessages);

  sendMessage({required String message}) async {
    try {
      emit(ChatLoading());
      MessageModel newMessage = MessageModel(
        message: message,
        id: email!,
        time: DateTime.now().toString(),
      );
      messages.add({
        'message': newMessage.message,
        'id': newMessage.id,
        'time': newMessage.time
      });
    } catch (e) {
      emit(ChatFailure(e.toString()));
    }
  }

  void getMessage() {
    try {
      emit(ChatLoading());
      List<MessageModel> myList = [];
      messages.orderBy('time', descending: true).snapshots().listen((event) {
        for (var doc in event.docs) {
          myList.add(MessageModel.fromJson(doc));
        }
        emit(ChatSuccess(myList: myList));
      });
    } on Exception catch (e) {
      emit(ChatFailure(e.toString()));
    }
  }
}
