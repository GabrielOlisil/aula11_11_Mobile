import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

class MotivationalTipsPage extends StatefulWidget {
  const MotivationalTipsPage({Key? key}) : super(key: key);

  @override
  State<MotivationalTipsPage> createState() => _MotivationalTipsPageState();
}

class _MotivationalTipsPageState extends State<MotivationalTipsPage> {
  List<String> frases = [''];
  String frase = '';


  Future<void> _adicionarDialogo(BuildContext context) async {
    final result = await showTextInputDialog(
      context: context,
      message: 'Adicione a frase:',
      textFields: const [
        DialogTextField(
          hintText: 'Digite sua frase aqui',
        ),
      ],
    );

    // Se o resultado não for nulo e contiver a frase, adiciona à lista
    if (result != null && result.isNotEmpty) {
      setState(() {
        frases.add(result[0]);
      });
    }
  }


  void handlePressed(){
    int sorteado = sorteioIndex();
      setState(() {
        frase = frases[sorteado];
      });
  }


  int sorteioIndex() {
    Random random = new Random();
    int resultado = random.nextInt(frases.length);
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases Motivacoinais 2024"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        actions: [
          GestureDetector(onTap: () {
            _adicionarDialogo(context);
          }, child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(Icons.add_box_sharp, color: Colors.white,),
          ))
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(12.0), 
        child: Center(
          child: Column(
            children: [
              Text("Sorteie uma frase"),
              Text(frase, style: TextStyle(fontSize: 28),),
              ElevatedButton(onPressed: handlePressed, child: Text("Botao"))
            ],
          )
      ),),
    );
  }
}