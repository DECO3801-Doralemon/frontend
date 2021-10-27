import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';

class TagsWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const TagsWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(54, 22),
          shape: StadiumBorder(),
          backgroundColor: Colors.white,
          primary: greenTags,
          textStyle: TextStyle(fontSize: 15, fontFamily: "BalsamiqSans"),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 6),
          side: BorderSide(width: 2.0, color: greenTags),
        ),
        child: Text(text),
        onPressed: onClicked,
      );
}
