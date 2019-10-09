import 'package:flutter/material.dart';
import 'package:student_manager/src/blocs/app_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        usernameField(),
        passwordField(),
        Container(
          margin: EdgeInsets.only(top: 15),
        ),
        submitButton(),
      ],
    );
  }

  Widget usernameField() {
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

  Widget passwordField() {
    return StreamBuilder<Object>(
      stream: appBloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: appBloc.changePassword,
          decoration: InputDecoration(
            labelText: "Password",
            labelStyle: TextStyle(color: Colors.grey),
            errorText: snapshot.error
          ),
        );
      }
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text("Sign in"),
      color: Colors.blueGrey,
      onPressed: () {},
    );
  }
}
