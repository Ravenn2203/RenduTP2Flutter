import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_app_meteo/business_logic/cubits/app_weather_cubit.dart';
import 'package:tp_app_meteo/data/models/weather_model.dart';
import 'package:tp_app_meteo/presentation/pages/error_page.dart';
import 'package:tp_app_meteo/presentation/pages/loaded_page.dart';
import 'package:tp_app_meteo/presentation/pages/loading_page.dart';

class MeteoApp extends StatefulWidget {
  const MeteoApp({Key? key}) : super(key: key);

  @override
  State<MeteoApp> createState() => _MeteoAppState();
}

class _MeteoAppState extends State<MeteoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Météo App'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: ListView(
        children: [
          _getTextField(),
          _getBlocBuilder(),
        ],
      ),
    );
  }

  TextField _getTextField() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Entrez le nom de votre ville',
      ),
      onSubmitted: (value) {
        print('Recherche : ' + value);
        BlocProvider.of<AppWeatherCubit>(context).getWeather(value);
      },
    );
  }

  BlocBuilder<AppWeatherCubit, AppWeatherState> _getBlocBuilder() {
    return BlocBuilder<AppWeatherCubit, AppWeatherState>(
      builder: (context, state) {
        if (state is AppWeatherLoaded) {
          return FutureBuilder(
            future: BlocProvider.of<AppWeatherCubit>(context).weatherModel,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return ErrorPage(errorMessage: snapshot.error.toString());
                }
                return LoadedPage(model: snapshot.data);
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingPage();
              }
              return Text('');
            },
          );
        }else if(state is AppWeatherInitial){
          return Container(
            height: 600,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/photos-premium/ciel-bleu-nuages-blancs-arriere-plan-portrait_644862-13.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.025),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
