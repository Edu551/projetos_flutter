import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quantoResponder;

  const Questionario({
    super.key,
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.quantoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    //List<Widget> widgets =
    //    respostas.map((t) => Resposta(t, _responder)).toList();
    //List<Widget> widgets = [];
    // for (var textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => quantoResponder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
        //...widgets,
      ],
    );
  }
}
