import 'package:calculadora/ListPage.dart';
import 'package:calculadora/PagesRotasNomeadas/Infos.dart';
import 'package:flutter/material.dart';

class BoasVindas extends StatefulWidget {
  final String nome;

  const BoasVindas({required this.nome});

  @override
  State<BoasVindas> createState() => _BoasVindasState();
}

class _BoasVindasState extends State<BoasVindas> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: [
        Container(
            padding: EdgeInsets.all(50),
            child: Text(widget.nome, style: TextStyle(fontSize: 30),)),
        Infos(),
        ListPage()
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'List')
          ],
          onTap: (i) {
            setState(() {
              _currentIndex = i;
            });
          }),
    );
  }
}
