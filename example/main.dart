import 'dart:io';

import 'package:d_frame_art/src/utils/annotations/request_method.dart';

import 'app/resources/hello_world_resouce.dart';

import 'package:d_frame_art/main.dart';

void main() async {
  var app = await Application();
  await app.run();

  var server = app.requestsToServer(app.server);

  print('Server started');

  server.listen((HttpRequest request) {
    var hello = app.addController<HelloWorldResource>(
      HelloWorldResource(),
      RequestMethod('GET', '/say-hello'),
      '/hello-world',
      request.uri.toString(),
      request.method.toString(),
    );

    request.response.write(hello);
    request.response.close();
  });
}
