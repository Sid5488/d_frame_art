// import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';

import 'package:d_frame_art/app/resources/hello_world_resouce.dart';

Future<void> main(List<String> args) async {
  await Application().run();
}

class Application {
  Future<void> run() async {
    var server = await HttpServer.bind('127.0.0.1', 8080);

    requestsToServer(server);
  }

  void requestsToServer(HttpServer server) {
    server.listen((HttpRequest request) {
      addController<HelloWorldResource>(HelloWorldResource());
    });
  }

  dynamic addController<T>(T Controller) {
    var controller = reflect(Controller);
    var values = controller.invoke(Symbol('sayHello'), []);

    return values.reflectee;
  }
}
