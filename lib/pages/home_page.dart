import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bridge_sample/bloc/home_bloc.dart';
import 'package:flutter_bridge_sample/bloc_provider/home_bloc_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = HomeBlocProvider.of(context).bloc;

    return Scaffold(
      appBar: AppBar(title: Text("Flutter Bridge Sample"),),
      body: Center(
        child: StreamBuilder<String>(
          stream: bloc.platformStream,
          builder: (context, snapshot) {
            return Text(snapshot.data ?? "");
          },
        ),
      ),
    );
  }

}