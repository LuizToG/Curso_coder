import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 20) {
      return 'Parabéns!';
    } else if (pontuacao < 29) {
      return 'Você é bom!';
    } else if (pontuacao < 38) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text('Reiniciar?', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
