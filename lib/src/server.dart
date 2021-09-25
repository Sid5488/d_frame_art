import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';

import 'package:d_frame_art/src/utils/annotations/route.dart';

class Application {
  HttpServer server;

  void run() async {
    var server = await HttpServer.bind('127.0.0.1', 8080);

    this.server = server;
  }

  HttpServer requestsToServer(HttpServer server) {
    return server;
  }

  dynamic addController<T>(T Controller, [String url, String path]) {
    var controller = reflect(Controller);

    var route = controller.type.metadata.firstWhere(
      (meta) => meta.reflectee is Route,
      orElse: () => null,
    );

    if (path == url && url == (route.reflectee as Route).url) {
      var values = controller.invoke(Symbol('sayHello'), []);
      return jsonEncode(values.reflectee);
    }

    return null;
  }
}
