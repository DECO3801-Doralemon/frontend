import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/utils/textfield_widget.dart';

class BuildImageWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const BuildImageWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = NetworkImage(imagePath);
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.fill,
          height: 200,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }
}
