import 'package:flutter/material.dart';

import '../comandos/login_command.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  void _handleLoginPressed() async {
    setState(() => _isLoading = true);
    bool success = await LoginCommand().run("usuario", "password");
    if (!success)  setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : FlatButton(
                child: Text("Entrar"),
                onPressed: _handleLoginPressed,
              ),
      ),
    );
  }
}
