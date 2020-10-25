import 'package:flutter/material.dart';
import 'package:login_flutter/home/home_page.dart';
import 'package:login_flutter/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller;

  bool logando = false;

  TextEditingController _controllerUser = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();

  @override
  void initState() {
    controller = LoginController();
    super.initState();
  }

  void setLogando(bool cond) {
    setState(() {
      logando = cond;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Login",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _controllerUser,
                autofocus: true,
                style: TextStyle(fontSize: 15, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _controllerPass,
                autofocus: true,
                obscureText: true,
                style: TextStyle(fontSize: 15, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(height: 40),
              ButtonTheme(
                buttonColor: Colors.white70,
                child: RaisedButton(
                  child: Text(
                    "ENTRAR",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: logando
                      ? null
                      : () async {
                          setLogando(true);
                          var temp = await controller.login(
                            _controllerUser.text,
                            _controllerPass.text,
                          );
                          temp
                              ? Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                  builder: (context) {
                                    return HomePage();
                                  },
                                ), (Route<dynamic> route) => false)
                              : setLogando(false);
                        },
                ),
              ),
              Divider(
                height: 40,
              ),
              logando
                  ? Container(
                      height: 80,
                      width: 80,
                      child: CircularProgressIndicator(),
                    )
                  : Container()
            ],
          ),
        ));
  }
}
