import 'package:flutter/material.dart';

class GeneralForm extends StatefulWidget {
  const GeneralForm({super.key});

  @override
  State<GeneralForm> createState() => _CampoRadioState();
}

class _CampoRadioState extends State<GeneralForm> {
  TextEditingController _testando = TextEditingController();
  var _ValorRadio;
  String labelSlider = '';
  double valorSlider = 10.0;
  bool valorSwitch = true;
  bool _valor = false;
  bool _valor2 = false;
  bool _valor3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: <Widget>[
                Text(_testando.text),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        label:  Text("Digite um valor"),
                        labelStyle: TextStyle(fontSize: 25)),
                    style: const TextStyle(fontSize: 18),
                    controller: _testando,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Masculino'),
                Radio(
                  value: 'M',
                  groupValue: _ValorRadio,
                  onChanged: (val) {
                    setState(() {
                      _ValorRadio = val;
                    });
                  },
                ),
                const Text('Feminino'),
                Radio(
                  value: 'F',
                  groupValue: _ValorRadio,
                  onChanged: (val) {
                    setState(() {
                      _ValorRadio = val;
                    });
                  },
                ),
              ],
            ),
            RadioListTile(
                title: const Text('Sim'),
                value: 'S',
                groupValue: _ValorRadio,
                onChanged: (val) {
                  setState(() {
                    _ValorRadio = val;
                  });
                }),
            RadioListTile(
                title: const Text('Não'),
                value: 'N',
                groupValue: _ValorRadio,
                onChanged: (val) {
                  setState(() {
                    _ValorRadio = val;
                  });
                }),
            Column(
              children: [
                const Text("Leite"),
                Checkbox(
                  value: _valor,
                  onChanged: (val) {
                    setState(
                      () {
                        _valor = val!;
                      },
                    );
                  },
                ),
                CheckboxListTile(
                    title: Text("Arroz"),
                    secondary: Icon(Icons.add_box),
                    value: _valor2,
                    onChanged: (val) {
                      setState(() {
                        _valor2 = val!;
                      });
                    }),
                CheckboxListTile(
                    title: Text("Feijao"),
                    secondary: Icon(Icons.add_box),
                    value: _valor3,
                    onChanged: (val) {
                      setState(() {
                        _valor3 = val!;
                      });
                    }),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text("Pegar valores"),
                )
              ],
            ),
            Row(
              children: [
                Text('Gmail:'),
                Switch(
                  value: valorSwitch,
                  onChanged: (bool valor) {
                    setState(() {
                      valorSwitch = valor;
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                SwitchListTile(
                  activeColor: Colors.red.shade700,
                  activeTrackColor: Colors.redAccent,
                  inactiveThumbColor: Colors.yellow,
                  inactiveTrackColor: Colors.orange,
                  title: Text('Wpp'),
                  value: valorSwitch,
                  onChanged: (bool valor) {
                    setState(
                      () {
                        valorSwitch = valor;
                      },
                    );
                  },
                ),
                Slider(
                  divisions: 5,
                  label: labelSlider,
                    value: valorSlider,
                    onChanged: (double valor) {
                      setState(
                        () {
                          valorSlider = valor;
                          labelSlider = valor.toString();
                        },
                      );
                    },
                    min: 10.0,
                    max: 20.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: GeneralForm(),
  ),
);