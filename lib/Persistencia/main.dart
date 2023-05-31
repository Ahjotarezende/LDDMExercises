import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  final TextEditingController _textController = TextEditingController();
  String _textoSalvo = '';
  _salvarDados() async{
    String valor = _textController.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', valor);
  }

  _apagarDados() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('nome');
  }

  _recuperarDados() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textoSalvo = prefs.getString('nome') ?? 'Sem valor';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Digite um nome'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  _salvarDados();
                }, child: const Text('Salvar')),
                ElevatedButton(onPressed: (){
                  _apagarDados();
                }, child: const Text('Apagar')),
                ElevatedButton(onPressed: (){
                  _recuperarDados();
                }, child: const Text('Recuperar'))
              ],
            ),
            Text(_textoSalvo)
          ],
        ),
      ),
    );}
}

void main() => runApp(
  const MaterialApp(
    home: MainForm(),
  ),
);