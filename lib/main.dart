import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(new MaterialApp(
      title: 'Contatdor de Pessoas',
      home:Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode entrar!";

  void _changePeople(int delta){
    setState(() {
      _people += delta; // Atualiza a tela com o valor
      if (_people < 0){
        _infoText = " Mundo inverso ?!?";
      } else if (_people <= 10){
        _infoText = "Pode entrar!";
      }else {
        _infoText = "Lotado !";
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        Image.asset(
          "images/background.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center, //Centraliza elementos
          children: <Widget>[
            Text(
              'Pessoas: $_people',
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              // Linha
              mainAxisAlignment: MainAxisAlignment.center,
              //Centraliza elementos
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    child: Text(
                      '+1',
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {_changePeople(1);},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    child: Text(
                      '-1',
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {_changePeople(-1);},
                  ),
                )
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic),
            )
          ],
        )
      ],
    );
  }
}

