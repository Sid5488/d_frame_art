import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';

import 'utils/annotations/Route.dart';
import 'utils/annotations/request_method.dart';

/// This class controls the mains functions server
class Application {
  HttpServer? server;

  /// Init server
  dynamic run([String? localserver, int? port]) async {
    var server = await HttpServer.bind(
      localserver == null ? '127.0.0.1' : localserver,
      port == null ? 8080 : port,
    );

    this.server = server;
  }

  /// Return a listener request
  dynamic requestsToServer(HttpServer? server) {
    return server;
  }

  /// Add a controller to listener request
  /// [Controller] Controller that you want add to listener request
  /// [url] path controller
  /// [path] user request url
  dynamic addController<T>(
    T Controller,
    RequestMethod reqMethod, [
    String? url,
    dynamic request,
  ]) {
    var controller = reflect(Controller);
    var completedUrl = url.toString() + reqMethod.methodPath;
    String path = request.uri.toString();
    String method = request.method.toString();

    var route = controller.type.metadata.firstWhere(
      (meta) => meta.reflectee is Route,
      orElse: () => null as InstanceMirror,
    );

    Future<String> content = utf8.decodeStream(request);

    content.then((dynamic res) {
      print(jsonEncode(res));
    });

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
