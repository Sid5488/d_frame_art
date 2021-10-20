import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';

import 'package:d_frame_art/src/utils/annotations/request_method.dart';
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
    T Controller,
    RequestMethod reqMethod, [
    String url,
    String path,
    String method,
  ]) {
    var controller = reflect(Controller);
    var completedUrl = url + reqMethod.methodPath;

    var route = controller.type.metadata.firstWhere(
      (meta) => meta.reflectee is Route,
      orElse: () => null,
    );

    if (path == completedUrl &&
        url == (route.reflectee as Route).url &&
        reqMethod.method == method) {
      var values = controller.invoke(Symbol(reqMethod.nameMethod), []);
      return jsonEncode(values.reflectee);
    }

    return jsonEncode({
      'errorMessage': 'Not found!',
    });
  }

  void method() {}
}
