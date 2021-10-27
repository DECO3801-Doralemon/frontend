import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';

class ButtonPostRecipeWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonPostRecipeWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          // fixedSize: Size(142,
          //     50), // COULD BE CHANGED TO USE CONTAINERS THAT WRAP EACH BUTTON IN PROFILE PAGE
          shape: StadiumBorder(),
          primary: Colors.white,
          onPrimary: orangePrimary,

          textStyle: TextStyle(fontSize: 17, fontFamily: "BalsamiqSans"),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        ),
        child: Row(
          children: [
            Align(alignment: Alignment.center, child: Text(text)),
            Icon(Icons.add, color: greyPrimary)
          ],
        ),
        onPressed: onClicked,
      );
}
