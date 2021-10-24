import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/community_bloc.dart';
import 'package:pantry_saver_fe/component/appbar_widget.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/CommunityRecipe.dart';
import 'package:pantry_saver_fe/utils/button_post_recipe_widget.dart';
import 'package:pantry_saver_fe/utils/button_widget.dart';
import 'package:pantry_saver_fe/utils/community_item_widget.dart';
import 'package:pantry_saver_fe/utils/item_type_widget.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  late CommunityBloc _bloc;
  late List<CommunityRecipeModel> listCommunityRecipe;

  @override
  void initState() {
    super.initState();
    _bloc = CommunityBloc();
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
                                child: Container(
                                  height: 254,
                                  width: 540,
                                  child: FittedBox(
                                    child: Image.asset(
                                        'assets/images/mealplanner2.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: CircleAvatar(
                                    radius: 20.0,
                                    backgroundImage: NetworkImage(
                                        'https://static.wikia.nocookie.net/disney/images/f/f0/Profile_-_Jiminy_Cricket.jpeg/revision/latest?cb=20190312063605'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Text(
                                  "Alex Somad",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 70, bottom: 55, left: 65, right: 65),
                              child: Text(
                                "Here, you can post your recipes to let other people know your delicious meal !. You can also find some inspirations for your new meal.",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 20, top: 10),
                                  child: postButton(),
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 20,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                                ),
                              ],
                            ),
                            CommunityItemWidget(
                              text: "",
                              imagePath: 'assets/images/salmonbenedict2.png',
                              onChanged: (name) => {},
                              onClicked: () {},
                              // setState(() {});
                            ),
                          ],
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

  Widget postButton() => ButtonPostRecipeWidget(
        text: 'Post Recipe',
        onClicked: () {},
      );

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
