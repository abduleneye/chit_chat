import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatStates{
}
class ChatInitial extends ChatStates{
}

class LoadingMessages extends ChatStates{
}
class MessagesLoaded extends ChatStates{
  final List<Map<String, dynamic>> messages;
  MessagesLoaded({required this.messages});
}
