import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  final _heightTextEditController = TextEditingController();
  final _weightTextEditController = TextEditingController();
  int height, weight;

  @override
  void dispose() {
    _heightTextEditController.dispose();
    _weightTextEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산기'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _heightTextEditController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '키를 입력하세요',
            ),
            onChanged: (text) {
              print(text);
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _weightTextEditController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '몸무게를 입력하세요',
            ),
            onChanged: (text) {
              print(text);
            },
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text('결과'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              print(_heightTextEditController.text);
              print(_weightTextEditController.text);

              height = int.parse(_heightTextEditController.text);
              weight = int.parse(_weightTextEditController.text);


              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                          '키 : ' + _heightTextEditController.text +
                          '\n몸무게 : '  + _weightTextEditController.text +
                          '\nBMI : ' + (weight / pow(height / 100, 2)).toStringAsFixed(2).toString()

                      ),
                    );
                  });
            },
          ),
          SizedBox(
            height: 20,
          ),



        ],
      )
    );
  }
}
