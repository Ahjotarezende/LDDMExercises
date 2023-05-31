import 'package:calculadora/DataBetweenScreens/SecondPage.dart';
import 'package:flutter/material.dart';

final TextEditingController _nameController = TextEditingController();

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Digite seu nome'),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.of(context)
                    .pushNamed("/segunda", arguments: _nameController.text);
              });
            },
            child: const Text('Ir para segunda tela'))
      ],
    ));
  }
}

void main() => runApp(
      MaterialApp(
        home: const MainPage(),
        initialRoute: "/",
        routes: {"/segunda": (context) => SecondPage(_nameController.text)},
      ),
    );
