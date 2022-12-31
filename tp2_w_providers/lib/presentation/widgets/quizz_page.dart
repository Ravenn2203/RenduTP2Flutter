import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/question.dart';
import 'resultats_page.dart';
import '../../data/repositories/question_repository.dart';
import '../../business_logic/providers/quizz.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);

  final String title = 'Quizz!';

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quizz!'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 70, 30, 30),
          child: Column(
            children: [
              _getImage(),
              SizedBox(
                height: 40,
              ),
              _getQuestionCard(),
              SizedBox(
                height: 150,
              ),
              _getAnswerButtons(),
            ],
          ),
        ));
  }

  Container _getImage() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 5, color: Colors.black),
        ),
        child: Consumer<Quizz>(
          builder: (context, quizz, child) {
            return Image.asset(
              '${quizz.question.imagePath}',
              height: 180,
              width: 450,
              fit: BoxFit.fitWidth,
            );
          },
        ));
  }

  Card _getQuestionCard() {
    return Card(
      elevation: 0,
      color: Colors.grey[600],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<Quizz>(builder: (context, quizz, child) {
          return Text('${quizz.question.questionText}',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 18.0,
              ));
        }),
      ),
    );
  }

  Row _getAnswerButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            child: Text('Vrai'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: context.watch<Quizz>().couleurBouttonVrai,
            ),
            onPressed: () {
              if (!Provider.of<Quizz>(context, listen: false).aRepondu) {
                if (_checkAnswer(true, context)) {
                  context
                      .read<Quizz>()
                      .affecterCouleursBouttons(Colors.green, Colors.grey);
                  const snackBar = SnackBar(
                    content: Text('Bien joué!'),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  context
                      .read<Quizz>()
                      .affecterCouleursBouttons(Colors.red, Colors.grey);
                }
              }
            }),
        TextButton(
            child: Text('Faux'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: context.watch<Quizz>().couleurBouttonFaux,
            ),
            onPressed: () {
              if (!Provider.of<Quizz>(context, listen: false).aRepondu) {
                if (_checkAnswer(false, context)) {
                  context
                      .read<Quizz>()
                      .affecterCouleursBouttons(Colors.grey, Colors.green);
                  const snackBar = SnackBar(
                    content: Text('Bien joué!'),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  context
                      .read<Quizz>()
                      .affecterCouleursBouttons(Colors.grey, Colors.red);
                }
              }
            }),
        ElevatedButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey[600],
          ),
          icon: Icon(
            Icons.arrow_forward_outlined,
          ),
          label: Text('Question suivante'),
          onPressed: () {
            if (Provider.of<Quizz>(context, listen: false).nbQuestionsPosees ==
                    0 &&
                Provider.of<Quizz>(context, listen: false).aRepondu) {
              Navigator.pushNamed(context, '/resultats');
            } else {
              if (Provider.of<Quizz>(context, listen: false).aRepondu) {
                context.read<Quizz>().changerQuestion();
              } else {
                const snackBar = SnackBar(
                  content:
                      Text('Veuillez répondre avant de changer de question !'),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          },
        ),
      ],
    );
  }

  bool _checkAnswer(bool userChoice, BuildContext context) {
    bool response =
        Provider.of<Quizz>(context, listen: false).question.isCorrect;
    if (response == userChoice) {
      context.read<Quizz>().augmenterBonnesReponses();
    }
    return response == userChoice;
  }
}
