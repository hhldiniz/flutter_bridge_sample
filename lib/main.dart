import 'package:flutter/material.dart';
import 'package:flutter_bridge_sample/pages/home_page.dart';

import 'bloc_provider/home_bloc_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bridge Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeBlocProvider(HomePage()),
    );
  }
}
