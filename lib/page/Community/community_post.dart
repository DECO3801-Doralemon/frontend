import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/community_bloc.dart';
import 'package:pantry_saver_fe/component/appbar_community_post_white.dart';
import 'package:pantry_saver_fe/component/appbar_widget.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/CommunityRecipe.dart';
import 'package:pantry_saver_fe/page/Community/community.dart';
import 'package:pantry_saver_fe/utils/build_image_widget.dart';
import 'package:pantry_saver_fe/utils/button_community_post_widget.dart';
import 'package:pantry_saver_fe/utils/button_widget.dart';
import 'package:pantry_saver_fe/utils/community_item_widget.dart';
import 'package:pantry_saver_fe/utils/community_post_item_widget.dart';
import 'package:pantry_saver_fe/utils/tags_widget.dart';

class CommunityPostPage extends StatefulWidget {
  final String recipe_id;
  CommunityPostPage({required this.recipe_id});

  @override
  _CommunityPostPageState createState() =>
      _CommunityPostPageState(this.recipe_id);
}

class _CommunityPostPageState extends State<CommunityPostPage> {
  late CommunityBloc _bloc;
  late List<CommunityRecipeModel> listCommunityRecipe;

  String recipe_id;
  _CommunityPostPageState(this.recipe_id);

  @override
  void initState() {
    super.initState();
    _bloc = CommunityBloc();
  }

  void _postRecipe(String recipe_id) async {
    final response = await _bloc.PostRecipe(recipe_id);
    print(response);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => CommunityPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
          builder: (context) => Scaffold(
              appBar: communityPostWhiteAppBar(context),
              body: SizedBox.expand(
                  child: FutureBuilder(
                      future: _bloc.fetchPersonal(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<CommunityRecipeModel>?> snapshot) {
                        if (snapshot.hasData) {
                          listCommunityRecipe = snapshot.data!;
                          print("999999999999");
                          print(listCommunityRecipe);
                          print("888888888888");
                          return PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listCommunityRecipe.length,
                            itemBuilder: (context, index) {
                              return ListView(children: [
                                const SizedBox(height: 27),
                                Container(
                                    margin:
                                        EdgeInsets.only(right: 20, left: 20),
                                    child: Text(
                                      "Choose a recipe that you already made",
                                      style: TextStyle(fontSize: 19),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(right: 15, left: 15),
                                  child: CommunityPostItemWidget(
                                      text:
                                          "${listCommunityRecipe[index].recipe_name}",
                                      imagePath:
                                          "https://doralemon-backend.herokuapp.com${listCommunityRecipe[index].photo_url}",
                                      onClicked: () {}),
                                ),
                                const SizedBox(height: 24),
                                Container(
                                  margin: EdgeInsets.only(right: 15, left: 15),
                                  child: Card(
                                    color: greenLight,
                                    elevation: 1.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),
                                    child: Stack(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Container(
                                            //     decoration: BoxDecoration(
                                            //         color: orangePrimary,
                                            //         borderRadius: BorderRadius.only(
                                            //             topRight: Radius.circular(30.0),
                                            //             bottomRight: Radius.circular(30.0))),
                                            //     child: buildImage()),
                                            Container(
                                                // height: 60,
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    right: 15,
                                                    left: 15,
                                                    bottom: 10),
                                                child: TagsWidget(
                                                    text: "Egg",
                                                    onClicked: () {})),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 26),
                                Container(
                                    margin:
                                        EdgeInsets.only(right: 30, left: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Ingredients: ",
                                            style: TextStyle(fontSize: 19)),
                                        Text(
                                            "${listCommunityRecipe[index].needed_ingredients}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: greyPrimary)),
                                        const SizedBox(height: 24),
                                        Text(
                                          "Steps :",
                                          style: TextStyle(fontSize: 19),
                                        ),
                                        Text(
                                            "${listCommunityRecipe[index].steps}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: greyPrimary))
                                      ],
                                    )),
                                const SizedBox(height: 20),
                                Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: postButton(
                                                listCommunityRecipe[index].id)),
                                      ],
                                    )),
                                const SizedBox(height: 40),
                              ]);
                            },
                          );
                        } else if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(greenPrimary),
                            ),
                          );
                        }
                        return Container();
                      })))),
    );
  }

  Widget postButton(int id) => ButtonCommunityPostWidget(
        text: 'Post to Community',
        onClicked: () {
          _postRecipe(recipe_id);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => CommunityPage()),
            (Route<dynamic> route) => false,
          );
        },
      );

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
