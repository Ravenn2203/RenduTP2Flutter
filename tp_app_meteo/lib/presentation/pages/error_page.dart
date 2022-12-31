import 'package:flutter/material.dart';
import 'package:tp_app_meteo/business_logic/cubits/app_weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;

  ErrorPage({
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 100, color: Colors.red,),
            SizedBox(height: 20),
            Text(errorMessage, style: TextStyle(color: Colors.red, fontSize: 20.0),),
            SizedBox(height: 20),
          ],
        );
  }
}