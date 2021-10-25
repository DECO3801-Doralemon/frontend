import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/utils/textfield_widget.dart';

class CommunityPostItemWidget extends StatelessWidget {
  final int maxLines;
  final String text;
  final String imagePath;
  final VoidCallback onClicked;

  const CommunityPostItemWidget({
    Key? key,
    required this.text,
    this.maxLines = 1,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    // final image = NetworkImage(imagePath);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Card(
          color: orangeCard,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //     decoration: BoxDecoration(
                  //         color: orangePrimary,
                  //         borderRadius: BorderRadius.only(
                  //             topRight: Radius.circular(30.0),
                  //             bottomRight: Radius.circular(30.0))),
                  //     child: buildImage()),
                  buildImage(),

                  Container(
                    height: 43,
                    margin: EdgeInsets.only(top: 5, left: 25.0, right: 25.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Egg Benedict",
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 13),
      ],
    );
  }

  Widget buildImage() {
    // final image = NetworkImage(imagePath);
    final image = AssetImage(imagePath);
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
