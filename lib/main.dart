import 'package:flutter/material.dart';
import 'package:rest/history.dart';
import 'package:rest/network.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<History> progresses = [];
  List<History> completes = [];
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Progres Length = ${progresses.length}"),
            SizedBox(
              height: 16,
            ),
            Text("Complete Length = ${completes.length}"),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                getData(page);
              },
              child: Text("Load Page $page"),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  page = 0;
                  progresses.clear();
                  completes.clear();
                });
                getData(page);
              },
              child: Text("Reset"),
            )
          ],
        ),
      ),
    );
  }

  void getData(int x) {
    getHistoryPage(x).then((value) {
      value.forEach((data) {
        if ([0, 1].contains(data.status)) {
          setState(() {
            progresses.add(data);
          });
        } else {
          setState(() {
            completes.add(data);
          });
        }
      });
      setState(() {
        page++;
      });
    }).catchError((e) {
      // print(e);
    });
  }
}
