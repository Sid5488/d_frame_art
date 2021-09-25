import 'package:d_frame_art/src/utils/annotations/get_method.dart';
import 'package:d_frame_art/src/utils/annotations/route.dart';

@Route('/hello-world')
class HelloWorldResource {
  // Writing your methods

  @GetMethod('say-hello')
  dynamic sayHello() {
    return {
      'message': 'Hello d-frame-art',
    };
  }
}
