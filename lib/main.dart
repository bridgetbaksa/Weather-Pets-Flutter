import 'package:flutter/material.dart';
import 'package:weather_pets/screens/loading_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weather_pets/widgets/main_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainModel _model = MainModel();

    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: LoadingScreen(),
      ),
    );
  }
}
