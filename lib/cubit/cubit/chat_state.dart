part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatSuccess extends ChatState {
  final List<MessageModel> myList;

  ChatSuccess({required this.myList});
}

final class ChatFailure extends ChatState {
  final String errMessage;

  ChatFailure(this.errMessage);
}

final class ChatLoading extends ChatState {}
