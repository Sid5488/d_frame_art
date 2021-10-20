import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';

import 'package:d_frame_art/src/utils/annotations/get_method.dart';
import 'package:d_frame_art/src/utils/annotations/route.dart';

/// This class controls the mains functions server
class Application {
  HttpServer server;

  /// Init server
  void run([String localserver, int port]) async {
    var server = await HttpServer.bind(
      localserver == null ? '127.0.0.1' : localserver,
      port == null ? 8080 : port,
    );

    this.server = server;
  }

  /// Return a listener request
  HttpServer requestsToServer(HttpServer server) {
    return server;
  }

  /// Add a controller to listener request
  /// [Controller] Controller that you want add to listener request
  /// [url] path controller
  /// [path] user request url
  dynamic addController<T>(
    T Controller, [
    String url,
    String path,
    String methodParh,
    String reqMethod,
  ]) {
    var controller = reflect(Controller);

    var route = controller.type.metadata.firstWhere(
      (meta) => meta.reflectee is Route,
      orElse: () => null,
    );

    if (path == url && url == (route.reflectee as Route).url) {
      var values = controller.invoke(Symbol('sayHello'), []);
      return jsonEncode(values.reflectee);
    }

    return jsonEncode({
      'errorMessage': 'Not found!',
    });
  }

  void method() {}
}
