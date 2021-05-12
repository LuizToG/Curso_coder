/*import 'dart:ffi';

import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é  seu animal favorito',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Peguntas'),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[perguntaSelecionada]),
            ElevatedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Resposta 2'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Resposta 3'),
              onPressed: responder,
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}

*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual melhor chefe você teve?',
      'respostas': [
        {'texto': 'Andrea', 'pontuacao': 9},
        {'texto': 'Silas', 'pontuacao': 10},
        {'texto': 'Ricardo', 'pontuacao': 8},
        {'texto': 'Leite', 'pontuacao': 9},
      ],
    },
    {
      'texto': 'Qual seu esporte favorito?',
      'respostas': [
        {'texto': 'Futebol', 'pontuacao': 10},
        {'texto': 'Volei', 'pontuacao': 5},
        {'texto': 'Bastquete', 'pontuacao': 9},
        {'texto': 'Tênis', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual seu time do coração?',
      'respostas': [
        {'texto': 'Atletico-MG', 'pontuacao': 10},
        {'texto': 'Corinthians', 'pontuacao': 7},
        {'texto': 'Flamengo', 'pontuacao': 0},
        {'texto': 'Cruzeiro', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual sua Profissão?',
      'respostas': [
        {'texto': 'DBA Junior', 'pontuacao': 10},
        {'texto': 'Desenvolvedor', 'pontuacao': 10},
        {'texto': 'Gerente de Projeto', 'pontuacao': 10},
        {'texto': 'Analista de dados', 'pontuacao': 10},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
