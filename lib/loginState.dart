import 'package:calculadora/PagesRotasNomeadas/BoasVindas.dart';
import 'package:calculadora/ListPage.dart';
import 'package:calculadora/loginExercise.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState extends StatefulWidget {
  const LoginState({super.key});

  @override
  State<LoginState> createState() => _LoginState();
}

class _LoginState extends State<LoginState> {
  _login() async {
    final prefs = await SharedPreferences.getInstance();
    _passController.text != prefs.getString("pass") ||
        _emailController.text != prefs.getString("email")
        ? showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dados inválidos'),
          content: const Text(
              'Usuário e/ou senha incorreto(a)'),
          actions: <Widget>[
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    )
        : Navigator.of(context).pushNamed(
      "/boasVindas"
    );
  }

  final TextEditingController _passController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool verPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.expand(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: 'Digite seu email',
                      filled: true,
                      fillColor: Colors.blueGrey,
                      labelStyle: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 240,
                      child: TextField(
                        controller: _passController,
                        obscureText: verPass,
                        decoration: const InputDecoration(
                          labelText: 'Digite sua senha',
                          filled: true,
                          fillColor: Colors.blueGrey,
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                          verPass ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          verPass = !verPass;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 30.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    _login();
                  },
                  child: const Text(
                    'Enviar',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sem conta?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginExercise()));
                      },
                      child: const Text(' Criar uma agora',
                          style: TextStyle(color: Colors.blue)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Login'),
      ),
      drawer: const Drawer(),
    );
  }
}

void main() => runApp(
      MaterialApp(
        title: "Flutter demo",
        home: const LoginState(),
        initialRoute: "/",
        routes: {
          "/boasVindas": (context) => const BoasVindas(nome: 'Teste')
        },
      ),
    );
