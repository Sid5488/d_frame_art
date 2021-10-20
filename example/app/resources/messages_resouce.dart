import 'package:d_frame_art/src/utils/annotations/request_method.dart';
import 'package:d_frame_art/src/utils/annotations/route.dart';

import '../models/messages_model.dart';
import '../services/messages_services.dart';

@Route('/messages')
class MessagesResource {
  // Writing your methods
  List<MessagesModel> _messages = MessagesService().messages;

  @RequestMethod('GET', '/first-message', 'getFistMessage')
  Map<String, String> getFistMessage() {
    return {
      'message': _messages[0].message,
    };
  }

  @RequestMethod('POST', '/create', 'create')
  Map<String, String> create() {}
}
