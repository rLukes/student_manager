import 'package:flutter/material.dart';
import 'app_bloc.dart';

class Provider extends InheritedWidget {
  final bloc = AppBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static AppBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
