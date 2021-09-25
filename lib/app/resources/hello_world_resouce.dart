import 'dart:convert';

import 'package:d_frame_art/src/utils/annotations/Route.dart';

@Route('/hello-world')
class HelloWorldResource {
  dynamic sayHello() {
    return jsonEncode({
      'message': 'Hello World',
      // 'method': req.method.toString(),
      // 'uri': req.uri.toString()
    });
  }
}
