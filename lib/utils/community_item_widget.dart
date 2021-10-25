import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/utils/textfield_widget.dart';

class CommunityItemWidget extends StatelessWidget {
  final int maxLines;
  final String text;
  final String imagePath;
  final ValueChanged<String> onChanged;
  final VoidCallback onClicked;

  const CommunityItemWidget({
    Key? key,
    required this.text,
    this.maxLines = 1,
    required this.imagePath,
    required this.onChanged,
    required this.onClicked,
  }) : super(key: key);

//   @override
//   _CommunityItemWidgetState createState() => _CommunityItemWidgetState();
// }
//
// class _CommunityItemWidgetState extends State<CommunityItemWidget > {
//   late final CommunityItemWidget controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller = CommunityItemWidget(
//       text: widget.text,
//       onClicked: () {},
//       imagePath: '',
//       onChanged: (String value) {},
//     );
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//
//     super.dispose();
//   }

  @override
  Widget build(BuildContext context) {
    // final color = Theme.of(context).colorScheme.primary;
    // final image = NetworkImage(imagePath);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Card(
          color: Colors.white,
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
                    margin:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 25.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: CircleAvatar(
                            radius: 15.0,
                            backgroundImage: NetworkImage(
                                'https://static.wikia.nocookie.net/disney/images/f/f0/Profile_-_Jiminy_Cricket.jpeg/revision/latest?cb=20190312063605'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Text(
                          "",
                          style: TextStyle(color: greyPrimary, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 25.0, right: 25.0),
                    child: Text("",
                        style: TextStyle(color: orangePrimary, fontSize: 24)),
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
