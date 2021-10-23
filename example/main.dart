import 'dart:io';

import '../lib/main.dart';
import '../lib/src/utils/annotations/request_method.dart';
import 'app/resources/messages_resouce.dart';

void main() async {
  var app = await Application();
  await app.run();

  var server = app.requestsToServer(app.server != null ? app.server : null);
  server.listen((HttpRequest request) {
    var response;

    response = app.addController<MessagesResource>(
      MessagesResource(),
      RequestMethod('GET', '/first-message', 'getFistMessage'),
      '/messages',
      request,
    );

    request.response.write(response);
    request.response.close();
  });
}
