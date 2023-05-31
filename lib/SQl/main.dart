import 'package:flutter/material.dart';
import 'package:path/path.dart';

class SQL extends StatefulWidget {
  const SQL({super.key});

  @override
  State<SQL> createState() => _SQLState();
}

class _SQLState extends State<SQL> {
  _recuper(){
    final caminhoBD = getDatabasesPath();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

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
