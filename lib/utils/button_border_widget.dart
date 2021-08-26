import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';

class ButtonBorderWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonBorderWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
          primary: redPrimary,
          textStyle: TextStyle(fontSize: 18, fontFamily: "BalsamiqSans"),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          side: BorderSide(width: 2.0, color: redPrimary),
        ),
        child: Text(text),
        onPressed: onClicked,
      );
}
