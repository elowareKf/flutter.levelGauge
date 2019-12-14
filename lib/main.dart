import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:level_gauge_test/widgets/LevelGauge.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<double> levels = [
    90,
    95,
    98,
    110,
    115,
    100,
    90,
    98,
    110,
    89,
    95,
    90,
    95,
    98,
    110,
    115,
    100,
    90,
    98,
    110,
    89,
    95,
    90,
    95,
    98,
    110,
    115,
    100,
    90,
    98,
    110,
    89,
    95,
    90,
    95,
    98,
    110,
    115,
    100,
    90,
    98,
    110,
    89,
    95,
    90,
    95,
    98,
    110,
    115,
    100,
    90,
    98,
    110,
    89,
    95
  ];

  @override
  Widget build(BuildContext context) {
    var _cardKey = Key('card');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                key: _cardKey,
                child: Stack(
                  children: <Widget>[
                    ListTile(
                      title: Text('Bach...'),
                      subtitle: Column(
                        children: <Widget>[
                          Text('Level'),
                          Container(
                            color: Colors.grey,
                              height: 50,
                              child: LevelGauge(
                                  maxLevel: 120, minLevel: 80, levels: levels)),
                        ],
                      ),
                      isThreeLine: true,

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

