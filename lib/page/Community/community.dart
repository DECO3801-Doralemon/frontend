import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/community_bloc.dart';
import 'package:pantry_saver_fe/component/appbar_community_feed_green.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/CommunityRecipe.dart';
import 'package:pantry_saver_fe/page/Community/community_personal.dart';
import 'package:pantry_saver_fe/page/Community/community_post.dart';
import 'package:pantry_saver_fe/page/profile.dart';
import 'package:pantry_saver_fe/utils/button_post_recipe_widget.dart';

class CommunityPage extends StatefulWidget {
  // late final int maxLines;
  // late final String text;
  // late final String imagePath;
  // late final ValueChanged<String> onChanged;
  // late final VoidCallback onClicked;

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
          appBar: communityGreenAppBar(context),
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
                          ////////////////
                          //INI FUTURE BUILDER BUAT NAMA DI ATAS
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      backgroundImage: AssetImage(
                                          'assets/images/facebook-default-no-profile-pic.jpg'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                  Text(
                                    "My Profile",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ///////////////////////////
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
                            FutureBuilder(
                                future: _bloc.fetchFeed(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<CommunityRecipeModel>?>
                                        snapshot) {
                                  if (snapshot.hasData) {
                                    listCommunityRecipe = snapshot.data!;
                                    print(listCommunityRecipe);
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: listCommunityRecipe.length,
                                      itemBuilder: (context, index) {
                                        // return CommunityItemWidget //INI MUNGKIN BISA DIGONTA GANTI IDK
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 5),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CommunityPersonalPage(
                                                              recipe_id:
                                                                  listCommunityRecipe[
                                                                          index]
                                                                      .id
                                                                      .toString())),
                                                );
                                              },
                                              child: Card(
                                                color: Colors
                                                    .white, //TO CHANGE THE COLOR OF THE CARDS
                                                elevation: 4.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30.0))),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // Container(
                                                        //     decoration: BoxDecoration(
                                                        //         color: orangePrimary,
                                                        //         borderRadius: BorderRadius.only(
                                                        //             topRight: Radius.circular(30.0),
                                                        //             bottomRight: Radius.circular(30.0))),
                                                        //     child: buildImage()),
                                                        buildImage(
                                                            imagePath:
                                                                "https://doralemon-backend.herokuapp.com${listCommunityRecipe[index].photo_url}"),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10.0,
                                                                  bottom: 10.0,
                                                                  left: 25.0),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            10.0),
                                                                child:
                                                                    CircleAvatar(
                                                                  radius: 13.0,
                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                          'https://painrehabproducts.com/wp-content/uploads/2014/10/facebook-default-no-profile-pic.jpg'),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                ),
                                                              ),
                                                              Text(
                                                                "${listCommunityRecipe[index].name}",
                                                                style: TextStyle(
                                                                    color:
                                                                        greyPrimary,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  left: 25.0,
                                                                  right: 25.0,
                                                                  bottom: 10),
                                                          child: Center(
                                                            child: Text(
                                                                "${listCommunityRecipe[index].recipe_name}",
                                                                style: TextStyle(
                                                                    color:
                                                                        orangePrimary,
                                                                    fontSize:
                                                                        24),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 13),
                                          ],
                                        );
                                      },
                                    );
                                  } else if (!snapshot.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                greenPrimary),
                                      ),
                                    );
                                  }
                                  return Container();
                                }),
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

  Widget buildImage({required String imagePath}) {
    // final image = NetworkImage(imagePath);
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
          // child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget postButton() => ButtonPostRecipeWidget(
        text: 'Post Recipe',
        onClicked: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => CommunityPostPage(
                      recipe_id: '',
                    )),
          );
        },
      );

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
