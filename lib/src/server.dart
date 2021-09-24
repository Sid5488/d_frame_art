import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> args) async {
  await Application().run();
}

class Application {
  Future<void> run() async {
    var server = await HttpServer.bind('127.0.0.1', 3002);

    requestsToServer(server);
  }

  void requestsToServer(HttpServer request) {
    request.listen((HttpRequest req) {
      requestMethod(req);

      req.response.write(jsonEncode({
        'message': 'Hello World',
        'method': req.method.toString(),
        'uri': req.uri.toString()
      }));
      req.response.close();
    });
  }

  void requestMethod(HttpRequest request) {
    print(request.method);
    print(request.uri);
  }
}
