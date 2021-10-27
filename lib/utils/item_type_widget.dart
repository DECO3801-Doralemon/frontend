import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/utils/textfield_widget.dart';

class ItemTypeWidget extends StatelessWidget {
  final int maxLines;
  final String text;
  final String imagePath;
  final ValueChanged<String> onChanged;
  final VoidCallback onClicked;

  const ItemTypeWidget({
    Key? key,
    required this.text,
    this.maxLines = 1,
    required this.imagePath,
    required this.onChanged,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    final image = NetworkImage(imagePath);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        Card(
          color: orangeCard,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              children: <Widget>[
                ListBody(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "My Freezer",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            )
                          ],
                        )),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: orangePrimary,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0))),
                                child: buildImage()))
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 13),
        Card(
          color: orangeCard,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              children: <Widget>[
                ListBody(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "My Fridge",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            )
                          ],
                        )),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: orangePrimary,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0))),
                                child: buildImage()))
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 13),
        Card(
          color: orangeCard,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              children: <Widget>[
                ListBody(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "My Pantry",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            )
                          ],
                        )),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: orangePrimary,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0))),
                                child: buildImage()))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImage() {
    final image = AssetImage(imagePath);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)),
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image,
            fit: BoxFit.fill,
            width: 177,
            height: 160,
            child: InkWell(onTap: onClicked),
          ),
        ),
      ),
    );
  }
}
