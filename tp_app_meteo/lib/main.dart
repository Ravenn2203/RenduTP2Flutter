import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_app_meteo/business_logic/cubits/app_weather_cubit.dart';
import 'presentation/widgets/meteo_app.dart';

void main() => runApp(MultiBlocProvider(providers: [
      BlocProvider<AppWeatherCubit>(
        create: (context) => AppWeatherCubit(),
      ),
    ], child: MyTp2App()));

class MyTp2App extends StatelessWidget {
  const MyTp2App({Key? key}) : super(key: key);

  //Cette fonction build retourne un widget, un arbre de widget si besoin
  @override
  Widget build(BuildContext context) {
    //Application utilisant du material design
    return MaterialApp(
      title: 'Ma deuxième application en Flutter !',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.green,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
      ),
      //Le widget de la page d'accueil
      initialRoute: '/',
      routes: {
        '/': (context) => MeteoApp(),
      },
    );
  }
}
