import 'package:flutter/material.dart';
import 'package:student_manager/src/blocs/app_bloc.dart';
import 'package:student_manager/src/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        usernameField(appBloc),
        passwordField(appBloc),
        Container(
          margin: EdgeInsets.only(top: 15),
        ),
        submitButton(appBloc),
      ],
    );
  }

  Widget usernameField(AppBloc appBloc) {
    return StreamBuilder<Object>(
        stream: appBloc.username,
        builder: (context, snapshot) {
          return TextField(
            decoration: InputDecoration(
                labelText: "username",
                labelStyle: TextStyle(color: Colors.grey),
                errorText: snapshot.error),
            onChanged: appBloc.changeUsername,
          );
        });
  }

  Widget passwordField(AppBloc appBloc) {
    return StreamBuilder<Object>(
        stream: appBloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: appBloc.changePassword,
            decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.grey),
                errorText: snapshot.error),
          );
        });
  }

  Widget submitButton(AppBloc appBloc) {
    return StreamBuilder<Object>(
        stream: appBloc.submitValid,
        builder: (context, snapshot) {
          return RaisedButton(
            child: Text("Login"),
            color: Colors.blueGrey,
            onPressed: snapshot.hasData ? () {} : null,
          );
        });
  }
}
