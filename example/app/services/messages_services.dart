import '../models/messages_model.dart';

class MessagesService {
  List<MessagesModel> messages = [MessagesModel('Hello d-frame-art')];

  bool createMessage(String message) {
    try {
      messages.add(MessagesModel(message));

      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
