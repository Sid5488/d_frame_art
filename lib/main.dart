library d_frame_art;

export 'src/server.dart';

import 'dart:io';

import 'package:d_frame_art/app/resources/hello_world_resouce.dart';

import 'src/server.dart';

void main() async {
  var app = await Application();
  await app.run();

  var server = app.requestsToServer(app.server);

  server.listen((HttpRequest request) {
    var hello = app.addController<HelloWorldResource>(
      HelloWorldResource(),
      '/hello-world',
      request.uri.toString(),
    );

    request.response.write(hello);
    request.response.close();
  });
}
