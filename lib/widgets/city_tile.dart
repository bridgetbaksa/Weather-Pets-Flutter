import 'package:flutter/material.dart';

class CityTile extends StatelessWidget {
  final String strImage;
  final String cityName;
  final String temp;

  CityTile({this.strImage, this.cityName, this.temp});

  @override
  Widget build(BuildContext context) {
    return ListTile(
//      onLongPress: ,
    contentPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
      leading: SizedBox(
        width: 150,
        child: Row(
          children: <Widget>[
            Text(
            '$temp°',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
        ),
            SizedBox(
              width: 75,
            ),
            Image(
              height: 30,
                width: 30,
                image: AssetImage(strImage)
            ),
          ],
        ),
      ),
      title: Text(
        cityName,
        style: TextStyle(
            color: Colors.white,
            fontSize: 25,
      ),
      ),
    );
  }
}