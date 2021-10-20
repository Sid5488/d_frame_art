import 'dart:convert';
import 'dart:io';

import 'package:d_frame_art/src/utils/annotations/request_method.dart';

import 'app/resources/messages_resouce.dart';

import 'package:d_frame_art/main.dart';

void main() async {
  var app = await Application();
  await app.run();

  var server = app.requestsToServer(app.server);
  server.listen((HttpRequest request) {
    var response;

    response = app.addController<MessagesResource>(
      MessagesResource(),
      RequestMethod('GET', '/first-message', 'getFistMessage'),
      '/messages',
      request.uri.toString(),
      request.method.toString(),
    );

    Future<String> content = utf8.decodeStream(request);

    content.then((dynamic res) {
      print(jsonEncode(res));
    });

    request.response.write(response);
    request.response.close();
  });
}
