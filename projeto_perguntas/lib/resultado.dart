import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(
    this.pontuacao,
    this.quandoReiniciarQuestionario, {
    super.key,
  });

  String get fraseResultado {
    if (pontuacao < 7) {
      return 'Parabéns!';
    } else if (pontuacao < 10) {
      return 'Você é bom!!!';
    } else if (pontuacao < 13) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
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
            style: const TextStyle(fontSize: 45),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            'Reiniciar!',
            style: TextStyle(fontSize: 28),
            selectionColor: Colors.amber,
          ),
        )
      ],
    );
  }
}
