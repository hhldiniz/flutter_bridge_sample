import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_bridge_sample/bloc/base_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomeBloc extends BaseBloc {
  StreamController<String> _platformStreamController =
      StreamController<String>();

  Stream<String> get platformStream => _platformStreamController.stream;

  retrievePlatformName(MethodChannel channel) {
    if (kIsWeb) {
      _platformStreamController.sink.add("Web");
    } else
      channel
          .invokeMethod("getPlatformName")
          .then((value) => _platformStreamController.sink.add(value));
  }

  @override
  void dispose() {
    _platformStreamController.close();
  }
}
