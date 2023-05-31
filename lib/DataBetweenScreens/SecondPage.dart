import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  String valor;
  SecondPage(this.valor, {super.key});
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.valor,
          style: TextStyle(fontSize: 40),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed("/");
              });
            },
            child: Text('Voltar'))
      ],
    ));
  }
}
