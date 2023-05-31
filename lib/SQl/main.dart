import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQL extends StatefulWidget {
  const SQL({super.key});

  @override
  State<SQL> createState() => _SQLState();
}

class _SQLState extends State<SQL> {

  _atualizarusuario(int id)async{
    Database bd = await _recuperar();
    Map<String, dynamic> dadosUsuario = {
      'nome': 'Antonio',
      'idade': 20
    };
    int retorno = await bd.update('usuarios', dadosUsuario, where: 'id = ?', whereArgs: [id]);
  }

  _excluir(int id)async{
    Database bd = await _recuperar();
    int retorno = await bd.delete('usuarios', where: 'id = ?', whereArgs: [id]);
    print(retorno);
  }

  _listarUm(int id)async{
    Database bd = await _recuperar();
    List usuarios = await bd.query(
      'usuarios',
      columns: ['id', 'nome', 'idade'],
      where: 'id = ?',
      whereArgs: [id]
    );
    for(var usu in usuarios){
      print('id ${usu['id'].toString()} nome ${usu['nome'].toString()} idade ${usu['idade'].toString()}');
    }
  }
  
  _listar()async{
    Database bd = await _recuperar();
    String sql = 'SELECT * FROM usuarios';
    List usuarios = await bd.rawQuery(sql);
    for(var usu in usuarios){
      print('id ${usu['id'].toString()} nome ${usu['nome'].toString()} idade ${usu['idade'].toString()}');
    }
  }

  _salvarDados(String nome, int idade)async{
    print(nome);
    print(idade);
    Database bd = await _recuperar();
    Map<String, dynamic> dadosUsuario = {
      'nome' : nome,
      'idade' : idade
    };
    int id = await bd.insert('usuarios', dadosUsuario);
    print('Salvo no id ${id}');
  }

  _recuperar() async{
    final caminhoBD = await getDatabasesPath();
    final localBD = join(caminhoBD, 'banco.db');
    var retorno = await openDatabase(
      localBD,
      version: 1,
      onCreate: (db, dbVersaoRecente){
        String sql = 'CREATE TABLE usuarios (id INTERGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTERGER';
        db.execute(sql);
      }
    );
    print('Aberto ${retorno.isOpen.toString()}');
    return retorno;
  }

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _recuperar();
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _nomeController,
            decoration: InputDecoration(
              labelText: 'Nome'
            ),
          ),
          TextField(
            controller: _idadeController,
            decoration: InputDecoration(
                labelText: 'Idade'
            ),
          ),
          TextField(
            controller: _idController,
            decoration: InputDecoration(
                labelText: 'ID'
            ),
          ),
          ElevatedButton(onPressed: (){
            _salvarDados(_nomeController.text, int.parse(_idadeController.text));
          }, child: Text('Criar')),
          ElevatedButton(onPressed: (){
            _atualizarusuario(int.parse(_idController.text));
          }, child: Text('Update')),
          ElevatedButton(onPressed: (){
            _excluir(int.parse(_idController.text));
          }, child: Text('Excluir')),
          ElevatedButton(onPressed: (){
            _listarUm(int.parse(_idController.text));
          }, child: Text('Procurar um')),
          ElevatedButton(onPressed: (){
            _listar();
          }, child: Text('Procurar')),
        ],
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    title: "Flutter demo",
    home: const SQL(),
  ),
);
