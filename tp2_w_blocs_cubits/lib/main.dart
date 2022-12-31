import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2/business_logic/cubits/answer_cubit.dart';
import 'package:tp2/presentation/widgets/resultats_page.dart';
import 'presentation/widgets/quizz_page.dart';
import 'package:bloc/bloc.dart';

void main() => runApp(MultiBlocProvider(providers: [
      BlocProvider<QuizzCubit>(
        create: (context) => QuizzCubit(),
      ),
    ], child: MyTp2App()));

class MyTp2App extends StatelessWidget {
  const MyTp2App({Key? key}) : super(key: key);

  //Cette fonction build retourne un widget, un arbre de widget si besoin
  @override
  Widget build(BuildContext context) {
    //Application utilisant du material design
    return MaterialApp(
      title: 'Ma première application en Flutter !',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.green,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
      ),
      //Le widget de la page d'accueil
      initialRoute: '/',
      routes: {
        '/': (context) => QuizzPage(),
        '/quizz': (context) => QuizzPage(),
        '/resultats': (context) => ResultatsPage(),
      },
    );
  }
}
