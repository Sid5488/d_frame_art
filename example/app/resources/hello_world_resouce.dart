import 'package:d_frame_art/src/utils/annotations/route.dart';

@Route('/hello-world')
class HelloWorldResource {
  dynamic sayHello() {
    return {
      'message': 'Hello d-frame-art',
    };
  }
}
