import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/community_bloc.dart';
import 'package:pantry_saver_fe/component/appbar_community_personal_white.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/CommunityRecipe.dart';
import 'package:pantry_saver_fe/utils/build_image_widget.dart';
import 'package:pantry_saver_fe/utils/tags_widget.dart';

class CommunityPersonalPage extends StatefulWidget {
  final String recipe_id;
  CommunityPersonalPage({required this.recipe_id});

  @override
  _CommunityPersonalPageState createState() =>
      _CommunityPersonalPageState(this.recipe_id);
}

class _CommunityPersonalPageState extends State<CommunityPersonalPage> {
  late CommunityBloc _bloc;
  late CommunityRecipeModel listCommunityRecipe;

  String recipe_id;
  _CommunityPersonalPageState(this.recipe_id);

  @override
  void initState() {
    super.initState();
    _bloc = CommunityBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: communityPersonalWhiteAppBar(context),
      body: ListView(children: [
        Stack(children: <Widget>[
          FutureBuilder(
              future: _bloc.FetchRecipeDetail(recipe_id),
              builder: (BuildContext context,
                  AsyncSnapshot<CommunityRecipeModel?> snapshot) {
                if (snapshot.hasData) {
                  listCommunityRecipe = snapshot.data!;
                  print(listCommunityRecipe);
                  return Container(
                    child: BuildImageWidget(
                        imagePath:
                            'https://doralemon-backend.herokuapp.com${listCommunityRecipe.photo_url}',
                        onClicked: () {}),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(greenPrimary),
                    ),
                  );
                }
                return Container();
              }),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: greyPrimary,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(5)),
                  child: Icon(Icons.add),
                  onPressed: () {}),
            ],
          ),
          // const SizedBox(height: 50),
          FutureBuilder(
              future: _bloc.FetchRecipeDetail(recipe_id),
              builder: (BuildContext context,
                  AsyncSnapshot<CommunityRecipeModel?> snapshot) {
                if (snapshot.hasData) {
                  listCommunityRecipe = snapshot.data!;
                  print(listCommunityRecipe);
                  return Container(
                    padding: EdgeInsets.only(top: 150, right: 15, left: 15),
                    child: Card(
                      color: Colors.white,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child: Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 5, left: 25.0, right: 25.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${listCommunityRecipe.recipe_name}",
                                        style: TextStyle(
                                            color: orangePrimary,
                                            fontSize: 24)),
                                    Text(
                                      "by ${listCommunityRecipe.name}",
                                      style: TextStyle(color: greyPrimary),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10.0, bottom: 10.0, left: 25.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "${listCommunityRecipe.date_time_created}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(greenPrimary),
                    ),
                  );
                }
                return Container();
              }),
        ]),
        const SizedBox(height: 24),
        FutureBuilder(
            future: _bloc.FetchRecipeDetail(recipe_id),
            builder: (BuildContext context,
                AsyncSnapshot<CommunityRecipeModel?> snapshot) {
              if (snapshot.hasData) {
                listCommunityRecipe = snapshot.data!;
                print(listCommunityRecipe);
                return Container(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  child: Card(
                    color: greenLight,
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                // height: 60,
                                padding: EdgeInsets.only(
                                    top: 10, right: 15, left: 15, bottom: 10),
                                child:
                                    TagsWidget(text: "Egg", onClicked: () {})),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(greenPrimary),
                  ),
                );
              }
              return Container();
            }),
        const SizedBox(height: 26),
        FutureBuilder(
            future: _bloc.FetchRecipeDetail(recipe_id),
            builder: (BuildContext context,
                AsyncSnapshot<CommunityRecipeModel?> snapshot) {
              if (snapshot.hasData) {
                listCommunityRecipe = snapshot.data!;
                return Container(
                    padding: EdgeInsets.only(right: 30, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ingredients: "),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              listCommunityRecipe.needed_ingredients.length,
                          itemBuilder: (context, index) {
                            return Text(
                                "${listCommunityRecipe.needed_ingredients[index]}");
                          },
                        ),

                        // Text(
                        //     "100gr eggs, 400gr bread, 50gr lemon, 5gr oregano"),
                        const SizedBox(height: 24),
                        Text("Steps :"),
                        Text("${listCommunityRecipe.steps}")
                      ],
                    ));
              } else if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(greenPrimary),
                  ),
                );
              }
              return Container();
            }),
        const SizedBox(height: 40),
      ]),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
