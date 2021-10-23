import '../../../lib/src/utils/annotations/Route.dart';
import '../../../lib/src/utils/annotations/request_method.dart';
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

  // @RequestMethod('POST', '/create', 'create')
  // Map<String, String> create() {}
}
