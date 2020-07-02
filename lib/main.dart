import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print('Width: ${MediaQuery.of(context).size.width}');
    print('Height: ${MediaQuery.of(context).size.height}');
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              padding: EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100,
              child: Zoom(
                onPositionUpdate: (Offset position) {
                  print(position);
                },
                onScaleUpdate: (double scale, double zoom) {
                  print("$scale  $zoom");
                },
                child: Center(
                  child: Text("Happy zoom!!"),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
