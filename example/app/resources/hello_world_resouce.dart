import 'package:d_frame_art/src/utils/annotations/request_method.dart';
import 'package:d_frame_art/src/utils/annotations/route.dart';

import '../models/hello_models.dart';

@Route('/hello-world')
class HelloWorldResource {
  // Writing your methods

  @RequestMethod('GET', '/say-hello')
  dynamic sayHello() {
    var hello = HelloModel();

    hello.message = 'Hello d-frame-art';

    return {
      'message': hello.message,
    };
  }
}
