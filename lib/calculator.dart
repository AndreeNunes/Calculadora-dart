import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'memory.dart';

//André Lindão

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final memory = new Memory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buidDisplay(),
          Divider(
            height: 0.2,
          ),
          _buildKeyboard(),
        ],
      ),
    );
  }

  _buidDisplay() {
    return Expanded(
      child: Container(
        color: Colors.black,
        child: AutoSizeText(
          memory.result,maxLines: 1,
          minFontSize: 20,
          maxFontSize: 80,
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 80, color: Colors.white),
        ),
      ),
    );
  }

  _buildKeyBoardButton(String label,
      {int flex = 1, Color textColor = Colors.white}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: Colors.black,
        textColor: textColor,
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
        onPressed: () {
          setState(() {
             memory.applyCommand(label);
          });
        },
      ),
    );
  }

  _buildKeyboard() {
    return Container(
      height: 400,
      color: Colors.black,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyBoardButton('AC', textColor: Colors.deepOrange),
                _buildKeyBoardButton('DEL', textColor: Colors.deepOrange),
                _buildKeyBoardButton('%', textColor: Colors.deepOrange),
                _buildKeyBoardButton('/', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyBoardButton('7'),
                _buildKeyBoardButton('8'),
                _buildKeyBoardButton('9'),
                _buildKeyBoardButton('x', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyBoardButton('4'),
                _buildKeyBoardButton('5'),
                _buildKeyBoardButton('6'),
                _buildKeyBoardButton('-', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyBoardButton('1'),
                _buildKeyBoardButton('2'),
                _buildKeyBoardButton('3'),
                _buildKeyBoardButton('+', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyBoardButton('.', textColor: Colors.deepOrange),
                _buildKeyBoardButton('0'),
                _buildKeyBoardButton('+/-', textColor: Colors.deepOrange),
                _buildKeyBoardButton('='),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
