import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/component/appbar_widget.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/utils/item_type_widget.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  late CommunityRecipeBloc _bloc;
  late CommunityRecipeModel communityRecipe;
  late List<CommunityRecipeModel> listCommunityRecipe;

  @override
  void initState() {
    super.initState();
    _bloc = CommunityRecipeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: SizedBox.expand(
            child: Container(
              color: orangeCard,
              child: ListView(
                // padding: EdgeInsets.symmetric(horizontal: 13),
                physics: BouncingScrollPhysics(),
                children: [
                  Stack(
                    children: [
                      Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: FittedBox(
                                  child:
                                      Image.asset('assets/images/kulkas_2.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 55, horizontal: 65),
                              child: Text(
                                "Description about the Storage Page, what info does it show, etc.",
                                style: TextStyle(
                                    fontSize: 21, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 214),
                        padding: EdgeInsets.symmetric(horizontal: 13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              topLeft: Radius.circular(50.0)),
                          color: Colors.white,
                        ),
                        child: ItemTypeWidget(
                          text: "",
                          imagePath:
                              'https://static.wikia.nocookie.net/disney/images/f/f0/Profile_-_Jiminy_Cricket.jpeg/revision/latest?cb=20190312063605',
                          onChanged: (name) => {},
                          onClicked: () {},
                          // setState(() {});
                        ),
                      ),
                      // const SizedBox(height: ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
