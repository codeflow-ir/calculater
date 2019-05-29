import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'my Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title;

  MyHomePage({this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  String output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${widget.title}'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        new Container(
          alignment: Alignment.centerRight,
          height: 100,
          child: new Text(
            '${double.parse(output).toStringAsFixed(2)}',
            style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        new Expanded(child: new Container()),
        new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('/')
              ],
            ),
            new Row(
              children: <Widget>[
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('*')
              ],
            ),
            new Row(
              children: <Widget>[
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('+')
              ],
            ),
            new Row(
              children: <Widget>[
                buildButton('00'),
                buildButton('0'),
                buildButton('.'),
                buildButton('-')
              ],
            ),
            new Row(
              children: <Widget>[buildButton('='), buildButton('clear')],
            ),
          ],
        )
      ],
    );
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        onPressed: () {
          if (buttonText == 'clear') {
            num1 = 0.0;
            num2 = 0.0;
            output = "0";
          } else if (buttonText == '+' ||
              buttonText == '-' ||
              buttonText == "/" ||
              buttonText == "*") {
            num1 = double.parse(output);
            operand = buttonText;
            output = "0";
          } else if (buttonText == "=") {
            num2 = double.parse(output);
            if (operand == '+') {
              output = (num1 + num2).toString();
            } else if (operand == '-') {
              output = (num1 - num2).toString();
            } else if (operand == '/') {
              output = (num1 / num2).toString();
            } else if (operand == '*') {
              output = (num1 * num2).toString();
            }
            num1=0;
          }else if(buttonText=='.'){
            if(output.contains('.')){
              print('there is .');
            }else{
              output=output+buttonText;
            }
          } else {
            output = output + buttonText;
          }
          setState(() {});
        },
        child: new Text('${buttonText}'),
        color: Colors.pink,
        textColor: Colors.black,
        splashColor: Colors.blue,
        padding: EdgeInsets.all(25),
      ),
    );
  }
}
