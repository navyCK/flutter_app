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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _heightTextEditController,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return '키를 입력하세요.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '키를 입력하세요',
                ),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  print(text);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _weightTextEditController,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return '몸무게를 입력하세요.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게를 입력하세요',
                ),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  print(text);
                },
              ),
              SizedBox(
                height: 20,
              ),
              buildRaisedButton(context),
              SizedBox(
                height: 20,
              ),



            ],
          ),

        ),
      )
    );
  }

  RaisedButton buildRaisedButton(BuildContext context) {
    return RaisedButton(
          child: Text('결과'),
          color: Colors.blue,
          textColor: Colors.white,
          // ignore: missing_return
          onPressed: () {
            if(_formKey.currentState.validate()) {
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
              }
          },
        );
  }
}
