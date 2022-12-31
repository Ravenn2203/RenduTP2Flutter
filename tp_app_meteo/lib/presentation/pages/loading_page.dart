import 'package:flutter/material.dart';
import 'package:tp_app_meteo/business_logic/cubits/app_weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,200,0,0),
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(color: Colors.black)),
              SizedBox(height: 20),
              Text(
                'Loading...',
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            ],
          ),
    );
  }
}
