import 'package:calculadora/NavegacaoPopAndPush/screenTwo.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ScreenTwo()));
          }, child: Text("Prox Pag"))
        ],
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: ScreenOne(),
  ),
);