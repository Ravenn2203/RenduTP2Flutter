import 'package:flutter/material.dart';
import '../../data/repositories/question_repository.dart';
import '../../data/models/question.dart';

class Quizz extends ChangeNotifier{

  bool aRepondu = false;
  int nbQuestions = 7;
  int nbQuestionsPosees = 6;
  int nbBonnesReponses = 0;
  Color couleurBouttonVrai = Colors.grey;
  Color couleurBouttonFaux = Colors.grey;
  Question question = QuestionRepository().getQuestion();

  void changerQuestion(){
    question = QuestionRepository().getNextQuestion(nbQuestionsPosees);
    couleurBouttonVrai = Colors.grey;
    couleurBouttonFaux = Colors.grey;
    nbQuestionsPosees--;
    aRepondu = false;
    notifyListeners();
  }

  void affecterCouleursBouttons(Color couleurVrai, Color couleurFaux){
    couleurBouttonVrai = couleurVrai;
    couleurBouttonFaux = couleurFaux;
    aRepondu = true;
    notifyListeners();
  }

  void augmenterBonnesReponses() => nbBonnesReponses++;

}