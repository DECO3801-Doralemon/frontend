import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(152,
              50), // COULD BE CHANGED TO USE CONTAINERS THAT WRAP EACH BUTTON IN PROFILE PAGE
          shape: StadiumBorder(),
          primary: orangePrimary,
          onPrimary: Colors.white,
          textStyle: TextStyle(fontSize: 18, fontFamily: "BalsamiqSans"),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        child: Text(text),
        onPressed: onClicked,
      );
}