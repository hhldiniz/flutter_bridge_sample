import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bridge_sample/bloc/home_bloc.dart';
import 'package:flutter_bridge_sample/bloc_provider/home_bloc_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const platformChannel = MethodChannel('sample.bridge.flutter');

  HomeBloc? bloc;

  @override
  Widget build(BuildContext context) {
    bloc = HomeBlocProvider.of(context).bloc;

    WidgetsBinding.instance?.addPostFrameCallback(
        (_) => bloc?.retrievePlatformName(platformChannel));

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bridge Sample"),
      ),
      body: Center(
        child: StreamBuilder<String>(
          stream: bloc!.platformStream,
          builder: (context, snapshot) {
            return Text(snapshot.data != null
                ? "Hello from ${snapshot.data}"
                : "No Data");
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }
}
