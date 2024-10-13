import 'package:newchat/Constants.dart';

class MessageModel {
  final String message;
  final String time;
  final String id;

  MessageModel({required this.message, required this.time, required this.id});

  factory MessageModel.fromJson(JsonData) {
    return MessageModel(
        id: JsonData['id'],
        message: JsonData[kMessages],
        time: JsonData['time']);
  }
}
