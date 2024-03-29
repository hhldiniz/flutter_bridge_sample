import 'package:flutter/widgets.dart';
import 'package:flutter_bridge_sample/bloc/home_bloc.dart';

class HomeBlocProvider extends InheritedWidget {
  final HomeBloc bloc;

  HomeBlocProvider(Widget child, {Key? key}) :
        bloc = HomeBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      this != oldWidget;

  static HomeBlocProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: HomeBlocProvider)!;
}
