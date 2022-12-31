import 'package:flutter/material.dart';
import '../../business_logic/providers/quizz.dart';
import 'package:provider/provider.dart';

class ResultatsPage extends StatefulWidget {
  const ResultatsPage({Key? key}) : super(key: key);

  @override
  State<ResultatsPage> createState() => _ResultatsPageState();
}

class _ResultatsPageState extends State<ResultatsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Quizz!'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.white,
      body: Card(
        margin: EdgeInsets.fromLTRB(10,250,10,0),
        elevation: 0,
        color: Colors.grey[600],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
              'Vous avez répondu correctement à ' +
                  Provider.of<Quizz>(context, listen: false).nbBonnesReponses.toString() +
                  ' questions sur ' +
                  Provider.of<Quizz>(context, listen: false).nbQuestions.toString() +
                  '! Ce qui vous fait un score de : '+Provider.of<Quizz>(context, listen: false).nbBonnesReponses.toString()+'/'+Provider.of<Quizz>(context, listen: false).nbQuestions.toString(),
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 19.0,
              )),
        ),
      ),
    );
  }
}
