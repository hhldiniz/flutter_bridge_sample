import 'dart:async';

import 'package:flutter_bridge_sample/bloc/base_bloc.dart';

class HomeBloc extends BaseBloc {

  StreamController<String> _platformStreamController =
      StreamController<String>();

  Stream<String> get platformStream => _platformStreamController.stream;

  @override
  void dispose() {
    _platformStreamController.close();
  }
}
