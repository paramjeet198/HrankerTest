import 'package:flutter/foundation.dart';

class Log {
  static v(dynamic data) {
    if (kDebugMode) {
      print('Log: $data');
    }
  }
}
