import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tp2/data/models/question.dart';
import 'package:tp2/data/repositories/question_repository.dart';

part 'answer_state.dart';

class QuizzCubit extends Cubit<QuizzState> {
  QuizzCubit() : super(QuizzInitial());

  QuestionRepository questionRepository = QuestionRepository();
  Question question = QuestionRepository().getFirstQuestion();

  Color vrai = Colors.grey;
  Color faux = Colors.grey;
  bool aRepondu = false;
  int nbQuestions = 7;
  int nbBonnesReponses = 0;
  int numQuestion = 7;

  void changeButtonsColor(Color vrai, Color faux) {
    aRepondu = true;
    this.vrai = vrai;
    this.faux = faux;
    emit(QuizzColorsLoaded());
  }

  void prochaineQuestion(Color vrai, Color faux) {
    numQuestion--;
    question = questionRepository.getNextQuestion(numQuestion);
    emit(QuizzNextQuestionLoaded());
    vrai = Colors.grey;
    faux = Colors.grey;
    aRepondu = false;
  }

  void afficherResultats() {
    //TODO il faut utilise un listener là
  }

  void augmenterBonnesReponses() {
      nbBonnesReponses++;
      print('bonne réponse!');
  }
}
