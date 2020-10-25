import 'package:flutter/material.dart';
import 'package:login_flutter/login/login_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginController controller;

  @override
  void initState() {
    controller = LoginController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                child: Text(
                  "Entrar",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
