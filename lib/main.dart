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
  double _zoom = 10.0;

  @override
  Widget build(BuildContext context) {
    print('Width: ${MediaQuery.of(context).size.width}');
    print('Height: ${MediaQuery.of(context).size.height}');
    print("InitZoom: $_zoom");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          setState(() {
            print('Reset zoom');
            _zoom = 0.5;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.red,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Zoom(
                  initZoom: 0.5,
                  centerOnScale: true,
                  width: MediaQuery.of(context).size.width * _zoom,
                  height: MediaQuery.of(context).size.height * _zoom,
                onPositionUpdate: (Offset position) {
                  //print(position);
                },
                  onScaleUpdate: (scale, zoom) {
                    print("scale: $scale");
                    _zoom = zoom;
                    print("Zoom: $zoom");
                  },
                  child: Center(
                    child: Container(
                      color: Colors.red,
                      width: 200 * _zoom ,
                      height: 200 * _zoom ,
                      child: Text("Happy zoom!!"),
                    ),
                  ),
                ),
              ),
//            Container(
//              width: MediaQuery.of(context).size.width,
//              height: 100,
//            ),
            ],
          ),
        ),
      ),
    );
  }
}
