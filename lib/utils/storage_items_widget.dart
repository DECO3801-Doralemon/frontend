import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/utils/textfield_item_widget.dart';
import 'package:pantry_saver_fe/utils/textfield_widget.dart';
import 'package:pantry_saver_fe/utils/textfield_widget.dart';

class StorageItemWidget extends StatelessWidget {
  final int maxLines;
  final String text;
  final String imagePath;
  final ValueChanged<String> onChanged;
  final VoidCallback onClicked;

  const StorageItemWidget({
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
        Container(
          margin: EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "My Fridge",
                    style: TextStyle(fontSize: 29, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Here, we can give a brief description of what the Fridge page is, as well as the parameters of the items",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
        Card(
          color: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              children: <Widget>[
                ListBody(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, top: 8, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Chicken Breast",
                                style: TextStyle(
                                    color: greenPrimary, fontSize: 22),
                              ),
                              Text("Expires in 3 day(s)",
                                  style: TextStyle(
                                      color: redPrimary, fontSize: 13))
                            ],
                          ),
                        )),
                        Container(
                          padding: EdgeInsets.only(right: 32),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ItemFieldWidget(
                                text: text, onChanged: onChanged),
                          ),
                        )
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
          color: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              children: <Widget>[
                ListBody(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, top: 8, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lettuce",
                                style: TextStyle(
                                    color: greenPrimary, fontSize: 22),
                              ),
                              Text("Expires in 17 day(s)",
                                  style: TextStyle(
                                      color: greyPrimary, fontSize: 13))
                            ],
                          ),
                        )),
                        Container(
                          padding: EdgeInsets.only(right: 32),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ItemFieldWidget(
                                text: text, onChanged: onChanged),
                          ),
                        )
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
          color: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              children: <Widget>[
                ListBody(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, top: 8, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Beef Pastrami",
                                style: TextStyle(
                                    color: greenPrimary, fontSize: 22),
                              ),
                              Text("Expires in 17 day(s)",
                                  style: TextStyle(
                                      color: greyPrimary, fontSize: 13))
                            ],
                          ),
                        )),
                        Container(
                          padding: EdgeInsets.only(right: 32),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ItemFieldWidget(
                                text: text, onChanged: onChanged),
                          ),
                        )
                      ],
                    )
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
    final image = NetworkImage(imagePath);

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
