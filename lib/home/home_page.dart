import 'package:flutter/material.dart';
import 'package:login_flutter/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller = HomeController();

  Future<List<AvisoModel>> _avisos;

  @override
  void initState() {
    _avisos = _controller.getAllAviso();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
            future: _avisos,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Container(
                  child: Center(
                    child: Text("Error ${snapshot.error.toString()}"),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].texto),
                      );
                    });
              }
            }),
      ),
    );
  }
}
