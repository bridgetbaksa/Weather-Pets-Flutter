import 'package:flutter/material.dart';
import 'package:weather_pets/utilities/constants.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weather_pets/widgets/main_model.dart';
import 'package:weather_pets/widgets/cities_list.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {

  return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model)
  {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      model.updateName(cityName);
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: kTextFieldInputDecoration,
                      onChanged: (value) {
                        cityName = value;
                        print(cityName);
                      },
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      print(cityName);
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CitiesList(),
            ],
          ),
        ),
      ),
    );
  }
  );
  }
}